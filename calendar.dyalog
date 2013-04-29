:NameSpace Calendar

∇ Z ← calendar_slice (calendar from to)
        Z ← (⊃,/⊃1↓calendar)[from,from + ⍳ (to - from)]
∇

∇ Z ← new_calendar (name days slots)
        Z ← (name (days ⍴⊂(slots ⍴ 0) ))
∇

∇ Z ← visualize calendar
        Z ← (⊃calendar),' ',⊃{⍺,' ',⍵ }/{'OX'[0 1 ⍳ 0≠⍵] } ¨ ⊃1↓calendar
∇

∇ Z ← mark_as_booked (calendar slots booking);pairs;second
        pairs ← (⊂slots) ⌷ ,⍳ (⊃⍴2⊃calendar) (⊃⍴⊃2⊃calendar)        
        second ← 2⊃calendar
        second[pairs] ← booking
        calendar[2] ← ⊂second
        Z ← calendar
∇

:EndNameSpace