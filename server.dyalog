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

∇ handle_event (name event);event_name
     event_name ← ⍕event[3]
     :Select event_name
     :Case ' Connect '
             ⎕ ← 'Connected'
     :Case ' Block '
             handle_data_received event
     :Else 
     :EndSelect
∇

∇ Z ← handle_data_received event;reply
     reply ← generate_reply ⍕event[2]
     #.DRC.Send event[1] reply 1
∇

∇ Z ← generate_reply data;command
     command ← #.Command.parse data
     :Select ⊃ command
     :Case 'get'             
             Z ← 'you got it!'
     :Case 'book' 
             Z ← 'booked you'
     :EndSelect
∇

:EndNameSpace