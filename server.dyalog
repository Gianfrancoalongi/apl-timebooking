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
     :Case 'show'
             Z ← show_calendar 1↓command
     :Case 'book'
             Z ← book_slots 1↓command
     :EndSelect
∇

∇ Z ← add_new_bookable data
     calendars,← ⊂#.Calendar.new_calendar (⊃data) 3 3
     Z ← 'added a new calendar for ',⊃data
∇

∇ Z ← show_calendar data;selected
     selected ← ({ (⊂⊃⍵) ∊ data } ¨ calendars)/calendars
     Z ← ⊃{⍺,(⎕UCS 10),⍵}/ #.Calendar.visualize ¨ selected
∇

∇ Z ← book_slots data;indices;mode;from;to;duration;indices;slices;slots;selected
     (mode from to duration) ← data[1 2 3 4]
     indices ← ({ (⊂⊃⍵) ∊ 4↓data } ¨ calendars)/⍳⍴calendars
     :Select mode
     :Case 'all'
             selected ← calendars[indices]
             slices ← { #.Calendar.calendar_slice ⍵ (⍎from) (⍎to) } ¨ selected
             slots ← #.Booking.indices_of_slots_with_all_musts_and_maximizing_could slices ⍬ (⍎duration)
             calendars[indices] ← { #.Calendar.mark_as_booked ⍵ slots 1 } ¨ selected
             Z ← 'booked slots ',⍕slots
     :EndSelect
∇

:EndNameSpace