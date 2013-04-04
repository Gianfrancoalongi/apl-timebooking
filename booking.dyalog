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

:EndNameSpace