:NameSpace Booking_tests

∇ Z ← free_intersecting_on_all_free_slots_TEST
        slots ← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        #.UT.expect ← 3 3 3
        Z ← #.Booking.free_intersecting slots
∇

:EndNameSpace