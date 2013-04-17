:NameSpace Calendar

∇ Z ← calendar_slice (calendar from to)
        Z ← (⊃,/calendar)[from,from + ⍳ (to - from)]
∇

:EndNameSpace