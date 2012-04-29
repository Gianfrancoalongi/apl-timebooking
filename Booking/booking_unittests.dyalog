:Namespace Booking_UT

UTNameTable ← ↑ (1 'a') (2 'b') (3 'c')
UTTable ← ↑ (3 0 0 0) (1 0 0 0) (2 0 0 0)

∇ Z ← UT1
  Z ← 'a' ≡ #.Booking.GETName UTNameTable 1
∇

∇ Z ← UT2
  Z ← 3 ≡ #.Booking.GETID UTNameTable 'c'
∇

∇ Z ← UT3;BookingSlots;BookingId;Expected
  BookingSlots ← (1 2 3) (3 1) (2 1 3)
  BookingId ← 5
  Expected ← ↑ (3 5 0 0) (1 0 5 5) (2 5 0 5)
  Z ← Expected ≡ #.Booking.Book UTTable BookingSlots BookingId
∇

∇ Z ← UT4;UTTable2;Expected
  UTTable2 ← ↑ (3 0 1 1 0 0) (1 1 1 0 0 0) (2 0 0 1 0 0)
  Expected ← ↑ (3 2 4) (1 3 3) (2 2 4)
  Z ← Expected ≡ #.Booking.MaxFree UTTable2
∇

∇ Z ← UT5;UTTable2;Expected
  UTTable2 ← ↑ (3 0 1 2 0 0) (1 5 7 0 0 0) (2 0 0 1 0 0)
  Expected ← ↑ (3 2 4) (1 3 3) (2 2 4)
  Z ← Expected ≡ #.Booking.MaxFree UTTable2
∇

∇ Z ← RunTest Name
  Z ← ⍎ Name
  :If ~ Z
   ⎕← '-------------------------'
   ⎕← 'Unit test ',Name,' failed'
   ⎕← ⎕vr Name
  :Endif
∇

∇ Z ← Test;Tests
  Tests ← 'UT1' 'UT2' 'UT3' 'UT4' 'UT5'
  Z ← RunTest ¨ Tests
  :if ^/ Z
   ⎕← 'All ' (⍴ Tests) 'tests passed' 
  :endif
∇

:EndNamespace
