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

∇ Z ← get_common_free_slots bookables;free;intersected
      free ← ↑ get_free_slots ¨ bookables
      periods ← 2 ⊃ ⍴ free
      intersected ←  ⊃,/{ free_intersection / free[;⍵] } ¨ ⍳ periods
      Z ←  remove_empty_periods intersected
∇ 

∇ Z ← remove_empty_periods intersected;bit_array
      bit_array ← ({⍬≢2 ⊃ ⍵} ¨ intersected) 
      :If 0≡+/bit_array
              Z ← ⍬
      :Else
              Z ← bit_array  / intersected
      :EndIf
∇

∇ Z ← l_slots free_intersection r_slots;period
      period ← 1 ⊃ l_slots
      intersection ← (2⊃l_slots) ∩ (2⊃r_slots)   
      Z ← (period intersection)
∇

∇ Z ← get_free_slots Bookable;table;indices;free_slots;mark
     table ← Bookable.table
     indices ← ⍳ 1 ⊃ ⍴ table
     mark ← 0
     free_slots ← { mark get_matching_slots_from_period ⍵ } ¨ ↓ table
     Z ← ↓ indices,[1.5]free_slots
∇

∇ Z ← Mark get_matching_slots_from_period Period;indices    
     indices ← ⍳ ⍴ Period
     Z ← (Mark=Period)/indices
∇

∇ book Args;marker
     marker ← 1
     marker mark Args
∇

∇ unbook Args;marker
    marker ←  0
    marker mark Args
∇

∇ Marker mark Args;Bookable;what_to_mark
     (Bookable what_to_mark) ← Args
     {Marker mark_slots Bookable ⍵ } ¨ what_to_mark
∇

∇ Marker mark_slots Args;Arg2;Bookable;period;slots 
    (Bookable Arg2) ← Args
    (period slots) ← Arg2
    Bookable.table[period;slots] ← Marker
∇


:EndNameSpace