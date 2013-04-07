:NameSpace Booking_tests

∇ Z ← free_intersecting_on_all_free_slots_TEST
        slots ← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        #.UT.expect ← 3 3 3
        Z ← #.Booking.free_intersecting slots
∇

∇ Z ← sorted_indices_of_free_intersecting_slots_TEST
        slots ← ⊂(1 0 0 0)
        slots,← ⊂(0 3 0 0)
        slots,← ⊂(4 0 5 0)
        #.UT.expect ← 4 2 3 1
        Z ← #.Booking.indices_free_intersecting slots
∇

∇ Z ← indices_of_free_across_all_slots_TEST
        slots ← ⊂(1 0 2 0)
        slots,← ⊂(0 0 3 0)
        slots,← ⊂(4 0 5 0)
        #.UT.expect ← 2 4
        Z ← #.Booking.indices_of_free_across_all_slots slots
∇

∇ Z ← musts_and_maximize_could_TEST
        musts ← ⊂(1 1 0 0 0 2)
        musts,← ⊂(0 3 0 0 0 4)
        could ← ⊂(5 5 5 0 6 6)
        could,← ⊂(0 0 7 0 0 0)
        duration ← 2
        #.UT.expect ← 4 5
        Z ← #.Booking.indices_musts_and_maximize_could musts could duration
∇

∇ Z ← musts_and_maximize_could_but_musts_can_not_duration_too_long_TEST
        musts ← ⊂(1 1 0 0 0 2)
        musts,← ⊂(0 3 0 0 0 4)
        could ← ⊂(5 5 5 0 6 6)
        could,← ⊂(0 0 7 0 0 0)
        duration ← 4
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_musts_and_maximize_could musts could duration        
∇

∇ Z ← musts_and_maximize_could_but_musts_can_not_one_fully_booked_TEST
        musts ← ⊂(1 1 1 1 2 2)
        musts,← ⊂(0 3 0 0 0 4)
        could ← ⊂(5 5 5 0 6 6)
        could,← ⊂(0 0 7 0 0 0)
        duration ← 2
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_musts_and_maximize_could musts could duration        
∇

:EndNameSpace