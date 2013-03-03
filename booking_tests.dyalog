:NameSpace Booking_tests

∇ Z ← new_bookable_has_all_free_TEST;periods;slots_per_period;dimensions;bookable
        periods ← 2
        slots_per_period ← 3
        dimensions ← periods slots_per_period
        bookable ← ⎕NEW #.Booking.Bookable ('test_bookable_one' dimensions)
        #.UT.expect ← (1 (1 2 3)) (2 (1 2 3))
        Z ← #.Booking.get_free_slots bookable
∇

:EndNameSpace