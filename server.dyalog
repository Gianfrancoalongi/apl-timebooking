:NameSpace Server

∇ Start port;r;DONE;wait
 #.DRC.Init ''
 r ← #.DRC.Srv 'Booking Server' '' port 'Text'
 :If 0≠⊃r
         ⎕ ← 'Error: ',⍕r
 :Else
         ⎕ ← 'Server started [',⍕port,']'
         DONE ← 0
         :While ~DONE
                 rc obj event data ← 4↑wait ← #.DRC.Wait 'Booking Server' 1000
                 :Select rc
                 :Case 0
                         :Select event
                         :Case 'Connect'
                                 r ← 'Welcome - and bye!'
                                 {}#.DRC.Send obj r 0
                         :Else
                         :EndSelect
                         {}#.DRC.Close obj 
                 :Case 100
                 :Else
                         ⎕ ← 'Error in Wait ',⍕wait
                         DONE ← 1
                 :EndSelect
         :EndWhile
         ⎕ ← 'Booking Server Terminating'
         {}#.DRC.Close 'Booking Server'
 :EndIf
∇

:EndNameSpace