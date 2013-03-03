:NameSpace Booking_tests

∇ Z ← new_bookable_has_all_free_TEST;bookable
        bookable ← new_bookable 2 3 'bookable_a'
        #.UT.expect ← (1 (1 2 3)) (2 (1 2 3))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← book_one_slot_on_bookable_TEST;bookable;period;slots
        bookable ← new_bookable 1 5 'bookable_b'
        period ← 1
        slots ← 2 3
        #.Booking.book bookable (⊂(period slots))
        #.UT.expect ← (⍬,⊂(1 (1 4 5)))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← new_bookable Args;periods;slots_per_period;name        
        (periods slots_per_period name) ← Args
        dimensions ← periods slots_per_period
        bookable ← ⎕NEW #.Booking.Bookable (name dimensions)
        Z ←  bookable
∇

:EndNameSpace