:Namespace Booking

GETName ← { Lookup ⍵,1 }
GETID ← { Lookup ⍵,2 }

∇ Z ← Lookup Input;LookupTable;Col;Key
  (LookupTable Key Col) ← Input
  Z ← LookupTable[LookupTable[;Col] ⍳ Key;1+2|Col]
∇

∇ Z ← Book Input;Table;Bookings;BookingId;Rows;Slots
  (Table Bookings BookingId) ← Input
  Rows ← Table[;1] ⍳ ⊃¨Bookings
  Slots ← 1↓¨Bookings
  {Table[1↑⍵;1+1↓⍵] ← BookingId} ¨ Rows,¨Slots
  Z←Table
∇

∇ Z ← MaxFree LookupTable;FreeSlots;MaxFreeSlots;Ids
  Ids ← LookupTable[;1]
  ⎕ML←3
  FreeSlots ← { (~⍵) ⊂ (⍳⍴⍵) } ¨ ↓1↓[2] LookupTable
  MaxFreeSlots ← {⊃⌈/⍵} ¨ FreeSlots
  ⎕ML←0
  Z ← ↑ ,/ Ids,[1.5]{(⍴⍵),1↑⍵} ¨ MaxFreeSlots
∇

:EndNamespace