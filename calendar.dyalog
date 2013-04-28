:NameSpace Calendar

∇ Z ← calendar_slice (calendar from to)
        Z ← (⊃,/calendar)[from,from + ⍳ (to - from)]
∇

∇ Z ← new_calendar (name days slots)
        Z ← (name (days ⍴⊂(slots ⍴ 0) ))
∇

:EndNameSpace