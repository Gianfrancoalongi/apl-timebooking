:NameSpace Calendar_tests

∇ Z ← calendar_slice_merges_between_gaps_TEST
        day_one ← (0 1 1)
        day_two ← (0 2 0)
        calendar ← day_one day_two
        from_slot ← 3
        to_slot ← 5
        #.UT.expect ← 1 0 2
        Z ← #.Calendar.calendar_slice calendar from_slot to_slot
∇


:EndNameSpace