:NameSpace Booking

∇ Z ← free_intersecting array_of_slots
        Z ← + ⌿ ↑ 0∘= ¨ array_of_slots
∇

∇ Z ← indices_free_intersecting array_of_slots
        Z ← ⍒ free_intersecting array_of_slots
∇

∇ Z ← indices_of_free_across_all_slots array_of_slots;intersections
        intersections ← free_intersecting array_of_slots
        Z ← ((⍴array_of_slots) = intersections) / ⍳⍴intersections
∇

∇ Z ← indices_musts_and_maximize_could args;must;could;duration;musts_indices;valid;coulds_per_slot;total_per_valid_slot
        (must could duration) ← args
        musts_indices ← indices_of_free_across_all_slots must
        valid ← generate_valid_index_groups_based_on_duration musts_indices duration
        coulds_per_slot ← free_intersecting could
        total_per_valid_slot ← { 1 + coulds_per_slot[⍵] } ¨ valid
        Z ← ⊃ valid[ ⍒ +/ ¨ total_per_valid_slot ]
∇

∇ Z ← generate_valid_index_groups_based_on_duration arg;indices;duration;groups
        (indices duration) ← arg
        groups ← duration ,/ indices
        Z ← (elements_ascend_by_one ¨ groups) / groups
∇

∇ Z ← elements_ascend_by_one array;elems_diff
        elems_diff ← 2 -/ array
        Z ← ((¯1+(⍴array)) ⍴ ¯1) ≡ elems_diff
∇

:EndNameSpace