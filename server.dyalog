:NameSpace Server

∇ Start port;r;name;mode
        name ← 'Booking Server'
        mode ← 'Text'
        #.DRC.Init ''
        r ← #.DRC.Srv name '' port mode
        :If 0≠⊃r
                ⎕ ← 'Error: ',⍕r
        :Else
                ⎕ ← name,' Started [',⍕port,']'
                connect_receive_loop name
                ⎕ ← name, 'Terminating'
                {}#.DRC.Close name
        :EndIf
∇

∇ connect_receive_loop name;DONE;event
        DONE ← 0
        :While ~DONE
                event ← #.DRC.Wait name 10000
                :If 0=⊃event
                        handle_event name event
                :Else
                        DONE ← 1
                :EndIf
        :EndWhile
∇

∇ handle_event (name event);event_name;data;reply;data
     event_name ← ⍕event[3]
     :Select event_name
     :Case ' Connect '
             ⎕ ← 'Connected'
     :Case ' Block '
             data ← ⍕event[4]
             ⎕ ← 'Received: ',data
             reply ← generate_reply data
             ⎕ ← 'Replying: '
             ⎕ ← reply
             #.DRC.Send event[2] reply 1
     :Case ' BlockLast '
             ⎕ ← 'Received [',event[4],'] and lost connection'
     :Else 
             ⎕ ← 'Not maching any other:[',event_name,']'
     :EndSelect
∇

∇ Z ← generate_reply data
     :Select data
     :Case ' get person1 '
             Z ← ⊃,/ { (⍕⍺),(⎕UCS 10),(⍕⍵) } /↓4 4⍴⍳16
     :EndSelect
∇

:EndNameSpace