:NameSpace Booking_tests

∇ Z ← new_bookable_has_all_free_TEST;bookable
        bookable ← new_bookable 2 3 'bookable_a'
        #.UT.expect ← (1 (1 2 3)) (2 (1 2 3))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← book_one_slot_on_bookable_TEST;bookable;period;slots
        bookable ← new_bookable 1 3 'bookable_b'
        period ← 1
        slots ← 2
        #.Booking.book bookable (⊂(period (⍬,slots)))
        #.UT.expect ← (⍬,⊂(1 (1 3)))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← book_several_slots_on_bookable_TEST;bookable;to_book
        bookable ← new_bookable 2 5 'bookable_c'
        to_book ← ⊂(1 (1 3 5))
        to_book ,← ⊂(2 (2 4))        
        #.Booking.book bookable to_book
        #.UT.expect ← ((1 (2 4)) (2 (1 3 5)))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← unbook_one_booked_slot_TEST;bookable
        bookable ← new_bookable 1 3 'bookable_d'
        what ← ⊂(1 (⍬,2))
        #.Booking.book bookable what
        #.Booking.unbook bookable what
        #.UT.expect ← (⍬,⊂(1 (1 2 3)))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← unbook_several_slots_on_bookable_TEST
        bookable ← new_bookable 2 5 'bookable_e'
        what ← ⊂(1 (1 3 5))
        what ,← ⊂(2 (2 4))        
        #.Booking.book bookable what
        #.Booking.unbook bookable what
        #.UT.expect ← ((1 (1 2 3 4 5)) (2 (1 2 3 4 5)))
        Z ← #.Booking.get_free_slots bookable
∇

∇ Z ← all_commonly_free_for_new_bookables_TEST
        bookables ← { new_bookable 2 5 ⍵ } ¨ 'a' 'b'
        #.UT.expect ← ((1 (1 2 3 4 5)) (2 (1 2 3 4 5)))
        Z ← #.Booking.get_common_free_slots bookables
        
∇

∇ Z ← only_other_period_commonly_free_for_booked_bookables_TEST;b_c;b_d
        b_c ← new_bookable 2 4 'c'
        #.Booking.book b_c (⊂(1 (1 2)))
        b_d ← new_bookable 2 5 'd'
        #.Booking.book b_d (⊂(1 (3 4)))
        #.UT.expect ← (⍬,⊂(2 (1 2 3 4)))
        Z ← #.Booking.get_common_free_slots b_c b_d
∇

∇ Z ← new_bookable Args;periods;slots_per_period;name        
        (periods slots_per_period name) ← Args
        dimensions ← periods slots_per_period
        bookable ← ⎕NEW #.Booking.Bookable (name dimensions)
        Z ←  bookable
∇

:EndNameSpace