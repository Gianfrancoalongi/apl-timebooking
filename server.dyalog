:NameSpace Server

∇ Start port;r;DONE;wait;rc;name;mode
        name ← 'Booking Server'
        mode ← 'Text'
        #.DRC.Init ''
        r ← #.DRC.Srv name '' port mode 1000 ('EOM' (⎕UCS 13))
        :If 0≠⊃r
                ⎕ ← 'Error: ',⍕r
        :Else
                ⎕ ← 'Server started [',⍕port,']'
                DONE ← 0
                :While ~DONE
                        wait ← #.DRC.Wait name 10
                        rc ← ⊃ wait
                        :Select rc
                        :Case 0
                                (obj event) ← wait[2 3]
                                :Select event
                                :Case 'Connect'
                                        ⎕ ← 'Connected'
                                :Case 'BlockLast'
                                        data ← wait[4]
                                        r ← ⌽ ⍕data
                                        {}#.DRC.Send obj r 0
                                        ⎕ ← 'Received[',data,'] & Sent[',r,']'
                                        {}#.DRC.Close obj
                                :EndSelect
                        :Case 100
                        :Else
                                DONE ← 1
                        :EndSelect
                :EndWhile
                ⎕ ← 'Booking Server Terminating'
                {}#.DRC.Close 'Booking Server'
        :EndIf
∇

:EndNameSpace