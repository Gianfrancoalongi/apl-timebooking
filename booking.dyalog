:NameSpace Booking

∇ Z ← total_free_per_slot array_of_slots
        Z ← + ⌿ ↑ 0∘= ¨ array_of_slots
∇

∇ Z ← sorted_indices_of_total_free_per_slot array_of_slots
        Z ← ⍒ total_free_per_slot array_of_slots
∇

∇ Z ← indices_of_free_across_all_slots array_of_slots;intersections
        intersections ← total_free_per_slot array_of_slots
        Z ← ((⍴array_of_slots) = intersections) / ⍳⍴intersections
∇

∇ Z ← indices_of_slots_with_all_musts_and_maximizing_could args;must;could;duration;musts_indices;valid;coulds_per_slot;total_per_valid_slot
        (must could duration) ← args
        musts_indices ← indices_of_free_across_all_slots must
        valid ← generate_valid_index_groups_based_on_duration musts_indices duration
        :IF ⍬ ≡ valid
                Z ← ⍬
        :Else
                coulds_per_slot ← total_free_per_slot could
                total_per_valid_slot ← { 1 + coulds_per_slot[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒ +/ ¨ total_per_valid_slot ]
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

∇ Z ← indices_maximizing_attending args;called;duration;attending_per_slot;valid;total_per_valid_slot
        (called duration) ← args
        attending_per_slot ← total_free_per_slot called
        valid ← generate_valid_index_groups_based_on_duration (⍳⍴⊃called) duration
        total_per_valid_slot ← { 1 + attending_per_slot[⍵] } ¨ valid
        Z ← ⊃ valid[ ⍒  +/ ¨ total_per_valid_slot ]
∇

:EndNameSpace