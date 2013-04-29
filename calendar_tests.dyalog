:NameSpace Calendar_tests

∇ Z ← simple_slice_of_first_day_TEST
        day_one ← (0 1 1)
        day_two ← (0 2 0)
        calendar ← 'person1' (day_one day_two)
        from_slot ← 1
        to_slot ← 3
        #.UT.expect ← 0 1 1
        Z ← #.Calendar.calendar_slice calendar from_slot to_slot
∇

∇ Z ← calendar_slice_merges_between_gaps_TEST
        day_one ← (0 1 1)
        day_two ← (0 2 0)
        calendar ← 'room1' (day_one day_two)
        from_slot ← 3
        to_slot ← 5
        #.UT.expect ← 1 0 2
        Z ← #.Calendar.calendar_slice calendar from_slot to_slot
∇

∇ Z ← new_calendar_creation_TEST
        bookable_name ← 'person1'
        days ← 2
        slots_per_day ← 3
        #.UT.expect ← 'person1' ((0 0 0) (0 0 0))
        Z ← #.Calendar.new_calendar bookable_name days slots_per_day
∇

∇ Z ← visualize_calendar_TEST
        calendar ← #.Calendar.new_calendar 'person1' 3 3
        #.UT.expect ← 'person1 OOO OOO OOO'
        Z ← #.Calendar.visualize calendar
∇

∇ Z ← visualize_booked_calendar_TEST
        calendar ← 'person1' ((0 1 0) (0 2 2) (3 0 4))
        #.UT.expect ← 'person1 OXO OXX XOX'
        Z ← #.Calendar.visualize calendar
∇

∇ Z ← mark_slots_as_booked_TEST
        calendar ← #.Calendar.new_calendar 'room1' 3 3 
        #.UT.expect ← 'room1' ((0 0 1) (1 0 1) (1 0 0))
        slots ← 3 4 6 7
        booking ← 1 
        Z ← #.Calendar.mark_as_booked calendar slots booking
∇

∇ Z ← mark_slots_bug_TEST
        calendar ← #.Calendar.new_calendar 'person1' 3 3 
        #.UT.expect ← 'person1' ((1 1 0) (0 0 0) (0 0 0))
        slots ← 1 2
        booking ← 1 
        Z ← #.Calendar.mark_as_booked calendar slots booking
∇

:EndNameSpace