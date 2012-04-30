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
  FreeSlots ← { ⍵ ⊂ (⍳⍴⍵) } ¨ 0 = ↓1↓[2] LookupTable
  MaxFreeSlots ← {⊃⌈/⍵} ¨ FreeSlots
  ⎕ML←0
  Z ← ↑ ,/ Ids,[1.5]{(⍴⍵),1↑⍵} ¨ MaxFreeSlots
∇

∇ Z ← MaxFreeSlots Input;Table;SlotRange;Slots;Ids;SubTable
  (Table SlotRange) ← Input
  Slots ← ⊃ ¯1 + +∘⍳/ SlotRange
  Ids ← Table[;1]
  SubTable ← (1↓[2] Table)[;Slots]
  Z←MaxFree Ids,SubTable
  Z[;2 ⊃⍴Z] ←+ ⊃ Slots
∇
:EndNamespace