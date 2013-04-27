:NameSpace Command

∇ Z ← parse text
        ⎕ML ← 3
        Z ← { (' '≠ ⍵) ⊂ ⍵ } lowercase ¨ text
        ⎕ML ← 0
∇

∇ Z ← lowercase char;from;to
        from ← 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        to ← 'abcdefghijklmnopqrstuvwxyz',char
        Z ←to[from ⍳ char]        
∇

:EndNameSpace
