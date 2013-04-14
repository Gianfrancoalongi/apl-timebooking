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

∇ Z ← indices_of_slots_with_all_musts_and_maximizing_could (must could duration);valid;coulds_per_slot;total_per_valid_slot
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

∇ Z ← indices_of_slots_maximizing_attending (called duration);attending_per_slot;valid;total_per_valid_slot
        attending_per_slot ← total_free_per_slot called
        :IF (duration > ⍴ attending_per_slot) ∨ (no_attending attending_per_slot)
                Z ← ⍬
        :Else
                valid ← generate_valid_index_groups_based_on_duration (⍳⍴⊃called) duration
                total_per_valid_slot ← { 1 + attending_per_slot[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒  +/ ¨ total_per_valid_slot ]
        :EndIf
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting (rooms duration);indices_of_free_slots
        indices_of_free_slots ← { (⍵ = 0)/⍳⍴⍵ } ¨ rooms
        slot_groups ← { generate_valid_index_groups_based_on_duration ⍵ duration } ¨ indices_of_free_slots
        Z ← (0≠⊃∘⍴ ¨ slot_groups)/ ⍳⍴rooms
∇

∇ Z ← index_of_room_maximizing_attending (rooms called duration);possible;indices_per_room;attending_per_room
        possible ← indices_of_rooms_that_can_hold_meeting rooms duration
        :IF possible ≡ ⍬
                Z ← ⍬
        :Else
                indices_per_room ← { indices_of_slots_with_all_musts_and_maximizing_could (rooms[⍵],⍬) called duration } ¨ possible
                attending_per_room ←  { + / total_free_per_slot rooms[possible[⍵]],called } ¨ ⍳⍴possible
                Z ← ⊃ ⍒ attending_per_room
        :EndIF
∇

∇ Z ← generate_valid_index_groups_based_on_duration (indices duration);groups
        :IF (duration > ⍴indices)
                Z ← ⍬
        :Else
                groups ← duration ,/ indices
                Z ← (elements_ascend_by_one ¨ groups) / groups
        :EndIf
∇

∇ Z ← elements_ascend_by_one array;elems_diff
        Z ← ¯1 ∧.= 2 -/ array
∇

∇ Z ← no_attending array
        Z ← 0 = + / array
∇
:EndNameSpace