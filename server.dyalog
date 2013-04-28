:NameSpace Server

calendars ← ⍬

∇ Start port;r;name;mode
        name ← 'Booking Server'
        mode ← 'Text'
        #.DRC.Init ''
        r ← #.DRC.Srv name '' port mode
        :If 0≠⊃r
                ⎕ ← 'Error: ',⍕r
        :Else
                set_up_calendars
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
     reply ← generate_reply ⍕event[4]
     #.DRC.Send event[2] reply 1
∇

∇ Z ← generate_reply data;command
     command ← #.Command.parse data
     :Select ⊃ command
     :Case 'add'
             Z ← add_new_bookable 1↓command
     :EndSelect
∇

∇ Z ← add_new_bookable data
     calendars,← ⊂#.Calendar.new_calendar (⊃data) 3 3
     Z ← 'added a new calendar for ',⊃data
∇

∇ set_up_calendars
     calendars ← ⊂#.Calendar.new_calendar 'person1' 3 3
     calendars,← ⊂#.Calendar.new_calendar 'room1' 3 3
∇

:EndNameSpace