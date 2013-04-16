:NameSpace Booking

∇ Z ← free_per_slot calendar_slices
        Z ← ⊃ +/0= calendar_slices
∇

∇ Z ← sorted_indices_of_free_per_slot calendar_slices
        Z ← ⍒ free_per_slot calendar_slices
∇

∇ Z ← indices_of_free_across_all_slots calendar_slices;free
        free ← free_per_slot calendar_slices
        Z ← ((⍴calendar_slices) = free) / ⍳ ⍴ free
∇

∇ Z ← indices_of_slots_with_all_musts_and_maximizing_could (must could duration);valid;could;total_per_valid_slot
        base_indices ← indices_of_free_across_all_slots must
        valid ← generate_valid_index_groups_based_on_duration base_indices duration
        :IF ⍬ ≡ valid
                Z ← ⍬
        :Else
                could ← free_per_slot could
                total_per_valid_slot ← { 1 + could[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒ +/ ¨ total_per_valid_slot ]
        :EndIf
∇

∇ Z ← indices_of_slots_maximizing_attending (called duration);attending;valid;total
        attending ← free_per_slot called
        :IF (duration > ⍴ attending) ∨ (no_attending attending)
                Z ← ⍬
        :Else
                valid ← generate_valid_index_groups_based_on_duration (⍳⍴⊃called) duration
                total ← { 1 + attending[⍵] } ¨ valid
                Z ← ⊃ valid[ ⍒  +/ ¨ total ]
        :EndIf
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting (rooms duration);indices_of_free_slots;groups
        indices_of_free_slots ← { (⍵ = 0)/⍳⍴⍵ } ¨ rooms
        groups ← { generate_valid_index_groups_based_on_duration ⍵ duration } ¨ indices_of_free_slots
        Z ← (0≠⊃∘⍴ ¨ groups)/ ⍳⍴rooms
∇

∇ Z ← index_of_room_maximizing_attending (rooms called duration);possible;indices_per_room;attending_per_room
        possible ← indices_of_rooms_that_can_hold_meeting rooms duration
        :IF possible ≡ ⍬
                Z ← ⍬
        :Else
                indices_per_room ← { indices_of_slots_with_all_musts_and_maximizing_could (rooms[⍵],⍬) called duration } ¨ possible
                attending_per_room ←  { + / free_per_slot rooms[possible[⍵]],called } ¨ ⍳⍴possible
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

∇ Z ← elements_ascend_by_one array
        Z ← ¯1 ∧.= 2 -/ array
∇

∇ Z ← no_attending array
        Z ← 0 = + / array
∇
:EndNameSpace