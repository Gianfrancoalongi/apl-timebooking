:NameSpace Booking_tests

∇ Z ← free_per_slot_TEST
        calendars ← ⊂(0 0 0)
        calendars,← ⊂(0 0 0)
        calendars,← ⊂(0 0 0)
        #.UT.expect ← 3 3 3
        Z ← #.Booking.free_per_slot calendars
∇

∇ Z ← sorted_indices_of_free_per_slot_TEST
        calendars ← ⊂(1 0 0 0)
        calendars,← ⊂(0 3 0 0)
        calendars,← ⊂(4 0 5 0)
        #.UT.expect ← 4 2 3 1
        Z ← #.Booking.sorted_indices_of_free_per_slot calendars
∇

∇ Z ← indices_of_free_across_all_slots_TEST
        calendars ← ⊂(1 0 2 0)
        calendars,← ⊂(0 0 3 0)
        calendars,← ⊂(4 0 5 0)
        #.UT.expect ← 2 4
        Z ← #.Booking.indices_of_free_across_all_slots calendars
∇

∇ Z ← all_musts_and_maximize_could_TEST
        musts ← ⊂(1 1 0 0 0 2)
        musts,← ⊂(0 3 0 0 0 4)
        could ← ⊂(5 5 5 0 6 6)
        could,← ⊂(0 0 7 0 0 0)
        duration ← 2
        #.UT.expect ← 4 5
        Z ← #.Booking.indices_of_slots_with_all_musts_and_maximizing_could musts could duration
∇

∇ Z ← musts_and_maximize_could_but_musts_can_not_duration_too_long_TEST
        musts ← ⊂(1 1 0 0 0 2)
        musts,← ⊂(0 3 0 0 0 4)
        could ← ⊂(5 5 5 0 6 6)
        could,← ⊂(0 0 7 0 0 0)
        duration ← 4
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_of_slots_with_all_musts_and_maximizing_could musts could duration
∇

∇ Z ← musts_and_maximize_could_first_possible_group_TEST
        musts ← ⊂(0 0 0 0 0 0)
        musts,← ⊂(0 0 0 0 0 0)
        could ← ⊂(0 0 0 0 0 0)
        could,← ⊂(0 0 0 0 0 0)
        duration ← 2
        #.UT.expect ← 1 2
        Z ← #.Booking.indices_of_slots_with_all_musts_and_maximizing_could musts could duration
∇

∇ Z ← musts_and_maximize_more_extensive_TEST
        musts ← ⊂(1 1 0 0 0 0)
        musts,← ⊂(0 0 0 0 0 2)
        could ← ⊂(3 0 0 4 4 4)
        could,← ⊂(5 5 0 0 0 0)
        duration ← 3
        #.UT.expect ← 3 4 5
        Z ← #.Booking.indices_of_slots_with_all_musts_and_maximizing_could musts could duration
∇

∇ Z ← maximizing_amount_of_attending_TEST
        called ← ⊂ (1 1 0 0 0 0)
        called,← ⊂ (0 2 0 0 0 3)
        called,← ⊂ (0 0 0 0 0 0)
        called,← ⊂ (0 4 4 0 0 5)
        duration ← 2
        #.UT.expect ← 4 5
        Z ← #.Booking.indices_of_slots_maximizing_attending called duration
∇

∇ Z ← maximizing_amount_of_attending_but_none_can_TEST
        called ← ⊂ (1 1 1)
        called,← ⊂ (2 2 2)
        called,← ⊂ (3 3 3)
        called,← ⊂ (4 4 4)
        duration ← 2
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_of_slots_maximizing_attending called duration
∇

∇ Z ← maximizing_amount_of_attending_but_duration_too_long_TEST
        called ← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        duration ← 4
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_of_slots_maximizing_attending called duration
∇

∇ Z ← maximizing_amount_of_attending_first_possible_TEST
        called ← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        called,← ⊂ (0 0 0)
        duration ← 2
        #.UT.expect ← 1 2
        Z ← #.Booking.indices_of_slots_maximizing_attending called duration
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting_TEST
        rooms ← ⊂(0 0 0)
        rooms,← ⊂(3 3 0)
        rooms,← ⊂(0 4 0)
        duration ← 2
        #.UT.expect ← 1,⍬
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting_all_can_TEST
        rooms ← ⊂(0 0 0)
        rooms,← ⊂(0 0 0)
        rooms,← ⊂(0 0 0)
        duration ← 2
        #.UT.expect ← 1 2 3
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting_none_can_TEST
        rooms ← ⊂(1 1 1)
        rooms,← ⊂(2 2 2)
        duration ← 2
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting_but_duration_too_long_TEST
        rooms ← ⊂(0 0 0)
        rooms,← ⊂(0 0 0)
        duration ← 4
        #.UT.expect ← ⍬
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

∇ Z ← index_of_room_that_maximizes_the_amount_of_attending_TEST
        rooms ← ⊂(0 0 0 0)
        rooms,← ⊂(1 0 0 0)
        called ← ⊂(0 0 0 0)
        called,← ⊂(0 0 2 2)
        duration ← 3
        #.UT.expect ← 1
        Z ← #.Booking.index_of_room_maximizing_attending rooms called duration
∇

∇ Z ← index_of_room_maximizing_attending_picks_first_TEST
        rooms ← ⊂(0 0 0 0)
        rooms,← ⊂(0 0 0 0)
        called ← ⊂(0 0 0 0)
        called,← ⊂(0 0 2 2)
        duration ← 2
        #.UT.expect ← 1
        Z ← #.Booking.index_of_room_maximizing_attending rooms called duration        
∇

∇ Z ← index_of_room_maximizing_attending_none_possible_all_rooms_booked_TEST
        rooms ← ⊂(1 1 1 1)
        rooms,← ⊂(2 2 2 2)
        called ← ⊂(0 0 0 0)
        called,← ⊂(0 0 0 0)
        duration ← 2
        #.UT.expect ← ⍬
        Z ← #.Booking.index_of_room_maximizing_attending rooms called duration
∇

∇ Z ← index_of_room_maximizing_attending_duration_too_long_TEST
        rooms ← ⊂(0 0)
        rooms,← ⊂(0 0)
        called ← ⊂(0 0)
        called,← ⊂(0 0)
        duration ← 3
        #.UT.expect ← ⍬
        Z ← #.Booking.index_of_room_maximizing_attending rooms called duration
∇

:EndNameSpace