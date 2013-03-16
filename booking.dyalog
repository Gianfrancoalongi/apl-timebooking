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

∇ Z ← maximize_bookables Args;bookables;f_t_d;from;to;duration;filtered;periods;maximizing
      (bookables (from to duration)) ← Args
      free ← ↑ get_free_slots  ¨ bookables
      periods ← 2 ⊃ ⍴ free    
      filtered ← ⊃,/{ filter_not_in_range from to (free[;⍵]) } ¨ ⍳ periods
      counted ← count_overlap_on_slots filtered
      maximizing ← find_slots_maximizing_bookables_for duration counted
      #.DISPLAY counted
      #.DISPLAY maximizing
      Z ← ⍬
∇

∇ Z ← find_slots_maximizing_bookables_for Args;duration;overlaps;matrix
      (duration overlaps) ← Args
      grouped ← (2 + / overlaps)
      indices ← 2 + / ((⍴ overlaps) ⍴ 1)
      matrix ← grouped⍪indices
      #.DISPLAY grouped
      Z ← ⍬
∇

∇ Z ← count_overlap_on_slots periods;min;max;chain;tmp
       min ← ⌊/⊃,/{2⊃⍵} ¨ periods
       max ← ⌈/⊃,/{2⊃⍵} ¨ periods
       chain ← (min-1) + ⍳ (max - (¯1+min))
       Z ← ⊃ + / { + ⌿ ↑ (2⊃⍵) ∘.= chain } ¨ periods
∇

∇ Z ← filter_not_in_range Args;from;to;free
      (from to free) ← Args
      in_period_range ← filter_by_period from to free
      in_all_ranges ← filter_by_slot_range from to in_period_range
      Z ← in_all_ranges
∇

∇ Z ← filter_by_period Args;from;to;free;from_period;to_period
      (from to free) ← Args      
      from_period ← 1 ⊃ from
      to_period ← 1 ⊃ to
      Z ← ({ ((1⊃⍵)≥from_period) ∧ ((1⊃⍵)≤to_period) } ¨ free) / free
∇

∇ Z ← filter_by_slot_range Args;from;to;free;from_slot;to_slot
      (from to free) ← Args
      from_slot ← 2 ⊃ from
      to_slot ← 2 ⊃ to
      Z ← { (1⊃⍵) ((to_slot ≥ (2⊃⍵) ∧ from_slot ≤ (2⊃⍵)) / (2⊃⍵)) } ¨ free
∇

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