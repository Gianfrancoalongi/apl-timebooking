:NameSpace Server

calendars ← ⍬

∇ Start port;r;name;mode
        load_conga_drc_if_not_already_present
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

∇ load_conga_drc_if_not_already_present
        :If 0=⎕NC '#.DRC'
                'DRC' #.⎕CY 'conga'
        :EndIf
∇

∇ connect_receive_loop name;DONE;event
        DONE ← 0
        :While ~DONE
                event ← #.DRC.Wait name 10000
                :If 0=⊃event
                        DONE ← handle_event name event
                :EndIf
        :EndWhile
∇

∇ Z ← handle_event (name event);event_name
     event_name ← ⍕event[3]
     :Select event_name
     :Case ' Connect '
             ⎕ ← 'Connected'
             Z ← 0
     :Case ' Block '
             Z ← handle_data_received event
     :Else
             Z ← 0
     :EndSelect
∇

∇ Z ← handle_data_received event;reply;done
     (done reply)← generate_reply ⍕event[4]
     #.DRC.Send event[2] reply 1
     Z ← done
∇

∇ Z ← generate_reply data;command;rest;done;reply
     command ← #.Command.parse data
     rest ← 1↓command
     done ← 0
     :Select ⊃ command
     :Case 'add'
             reply ← add_new_bookable rest
     :Case 'remove'
             reply ← remove_bookable rest
     :Case 'show'
             reply ← show_calendar rest
     :Case 'book'
             reply ← book_slots rest
     :Case 'stop'
             reply ← 'stopped server'
             done ← 1
     :EndSelect
     Z ← done reply
∇

∇ Z ← add_new_bookable data
     calendars,← { #.Calendar.new_calendar ⍵ 3 3 } ¨ data
     Z ← 'added a new calendar for ',⊃{⍺,' ',⍵ }/data
∇

∇ Z ← remove_bookable data;hits;removed;missing
     hits ← {(⊂⊃⍵) ∊ data} ¨ calendars
     removed ← ⊃ ¨ hits/calendars
     missing ← ({~(⊂⍵) ∊ (data ∩ removed) } ¨ data)/data
     :If 1 = ^/ data∊missing
             Z ← 'no such bookable ',⊃{⍺,' ',⍵}/missing
     :Else
             calendars ← (~hits)/calendars
             Z ← 'removed ',⊃{⍺,' ',⍵}/removed
     :EndIf
∇

∇ Z ← show_calendar data;selected
     selected ← ({ (⊂⊃⍵) ∊ data } ¨ calendars)/calendars
     :If 0=⊃⍴selected
             Z ← 'no such bookable ',⊃{⍺,' ',⍵}/data
     :Else
             Z ← ⊃{⍺,(⎕UCS 10),⍵}/ #.Calendar.visualize ¨ selected
     :EndIf
∇

∇ Z ← book_slots data;mode
     mode ← ⊃data
     :Select mode
     :Case 'all'
             Z ← book_all data
     :Case 'maximize'
             Z ← maximize_booking
     :EndSelect
∇

∇ Z ← book_all data;from;to;duration;indices;slices;slots;selected
     (from to duration) ← data[2 3 4]
     indices ← ({ (⊂⊃⍵) ∊ 4↓data } ¨ calendars)/⍳⍴calendars
     selected ← calendars[indices]
     slices ← { #.Calendar.calendar_slice ⍵ (⍎from) (⍎to) } ¨ selected
     slots ← (¯1 + ⍎from) + #.Booking.indices_of_slots_with_all_musts_and_maximizing_could slices ⍬ (⍎duration)
     calendars[indices] ← { #.Calendar.mark_as_booked ⍵ slots 1 } ¨ selected
     Z ← 'booked slots ',⍕slots
∇

∇ Z ← maximize_booking
     Z ← 'booking failed - not implemented'
∇

:EndNameSpace