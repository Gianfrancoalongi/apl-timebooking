:NameSpace Booking_tests

∇ Z ← total_free_per_slot_TEST
        slots ← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        slots,← ⊂(0 0 0)
        #.UT.expect ← 3 3 3
        Z ← #.Booking.total_free_per_slot slots
∇

∇ Z ← sorted_indices_of_total_free_per_slot_TEST
        slots ← ⊂(1 0 0 0)
        slots,← ⊂(0 3 0 0)
        slots,← ⊂(4 0 5 0)
        #.UT.expect ← 4 2 3 1
        Z ← #.Booking.sorted_indices_of_total_free_per_slot slots
∇

∇ Z ← indices_of_free_across_all_slots_TEST
        slots ← ⊂(1 0 2 0)
        slots,← ⊂(0 0 3 0)
        slots,← ⊂(4 0 5 0)
        #.UT.expect ← 2 4
        Z ← #.Booking.indices_of_free_across_all_slots slots
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

∇ Z ← indices_of_rooms_that_can_hold_meeting_TEST;rooms;duration
        rooms ← ⊂(0 0 0)
        rooms,← ⊂(3 3 0)
        rooms,← ⊂(0 4 0)
        duration ← 2
        #.UT.expect ← 1,⍬
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

∇ Z ← indices_of_rooms_that_can_hold_meeting_all_can_TEST;rooms;duration
        rooms ← ⊂(0 0 0)
        rooms,← ⊂(0 0 0)
        rooms,← ⊂(0 0 0)
        duration ← 2
        #.UT.expect ← 1 2 3
        Z ← #.Booking.indices_of_rooms_that_can_hold_meeting rooms duration
∇

:EndNameSpace