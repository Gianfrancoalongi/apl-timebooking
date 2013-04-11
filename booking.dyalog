:NameSpace Booking

∇ Z ← total_free_per_slot array_of_slots
        Z ← + ⌿ ↑ 0∘= ¨ array_of_slots
∇

∇ Z ← sorted_indices_of_total_free_per_slot array_of_slots
        Z ← ⍒ total_free_per_slot array_of_slots
∇

∇ Z ← indices_of_free_across_all_slots array_of_slots;free_per_slot
        free_per_slot ← total_free_per_slot array_of_slots
        Z ← ((⍴array_of_slots) = free_per_slot) / ⍳ ⍴ free_per_slot
∇

∇ Z ← indices_of_slots_with_all_musts_and_maximizing_could args;must;could;duration;musts_indices;valid;coulds_per_slot;total_per_valid_slot
        (must could duration) ← args
        base_indices ← indices_of_free_across_all_slots must
        valid ← generate_valid_index_groups_based_on_duration base_indices duration
        :IF ⍬ ≡ valid
                Z ← ⍬
        :Else
                coulds_per_slot ← total_free_per_slot could
                total_per_valid_slot ← { 1 + coulds_per_slot[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒ +/ ¨ total_per_valid_slot ]
        :EndIf
∇

∇ Z ← indices_of_slots_maximizing_attending args;called;duration;attending_per_slot;valid;total_per_valid_slot
        (called duration) ← args
        attending_per_slot ← total_free_per_slot called
        :IF (duration > ⍴ attending_per_slot) ∨ (no_attending attending_per_slot)
                Z ← ⍬
        :Else
                valid ← generate_valid_index_groups_based_on_duration (⍳⍴⊃called) duration
                total_per_valid_slot ← { 1 + attending_per_slot[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒  +/ ¨ total_per_valid_slot ]
        :EndIf
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting args;rooms;duration;indices_of_free_slots
        (rooms duration) ← args
        indices_of_free_slots ← { (⍵ = 0)/⍳⍴⍵ } ¨ rooms
        slot_groups ← { groups_of_timeslots_ascending_by_one duration ⍵ } ¨ indices_of_free_slots
        Z ← ⊃ (⍬∘≢ ¨ slot_groups) / ⍳⍴rooms
∇

∇ Z ← groups_of_timeslots_ascending_by_one args;indices;duration;groups
        (duration indices) ← args
        :IF duration ≥ ⍴indices
                Z ← ⍬
        :Else
                groups ← duration ,/ (indices,⍬)
                Z ← (elements_ascend_by_one ¨ groups) / groups
        :EndIf
∇

∇ Z ← generate_valid_index_groups_based_on_duration arg;indices;duration;groups
        (indices duration) ← arg
        :IF (duration > ⍴indices)
                Z ← ⍬
        :Else
                groups ← duration ,/ indices
                Z ← (elements_ascend_by_one ¨ groups) / groups
        :EndIf
∇

∇ Z ← elements_ascend_by_one array;elems_diff
        elems_diff ← 2 -/ array
        Z ← ((¯1+(⍴array)) ⍴ ¯1) ≡ elems_diff
∇

∇ Z ← no_attending array
        Z ← 0 = + / array
∇
:EndNameSpace