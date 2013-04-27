:NameSpace Command

∇ Z ← parse text
        Z ← split_on_whitespace lowercase ¨ text
∇

∇ Z ← lowercase char;from;to
        from ← 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        to ← 'abcdefghijklmnopqrstuvwxyz',char
        Z ←to[from ⍳ char]        
∇

∇ Z ← split_on_whitespace text
        ⎕ML ← 3
        Z ← (' '≠ text) ⊂ text
        ⎕ML ← 0
∇

:EndNameSpace
