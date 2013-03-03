:NameSpace Booking

:Class Bookable
        :Field Public name
        :Field Public table
        ∇ new_bookable Arg
            :Access Public
            :Implements Constructor
            name ← 1 ⊃ Arg
            table ← (2 ⊃ Arg) ⍴ 0
        ∇
:EndClass

∇ Z ← get_free_slots Bookable;table;indices;free_slots
     table ← Bookable.table
     indices ← ⍳ 1 ⊃ ⍴ table
     free_slots ← get_free_slots_from_period ¨ ↓ table     
     Z ← ↓ indices,[1.5]free_slots
∇

∇ Z ← get_free_slots_from_period Period;indices
     indices ← ⍳ ⍴ Period
     Z ← (0=Period)/indices
∇


∇ book Args;Bookable;what_to_book
     (Bookable what_to_book) ← Args
     { Bookable book_slots ⍵ } ¨ what_to_book
∇

∇ Bookable book_slots Args;period;slots
    (period slots) ← Args
    Bookable.table[period;slots] ← 1
∇

:EndNameSpace