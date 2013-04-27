:NameSpace Command_tests

∇ Z ← separates_command_word_and_data_TEST
        text ← 'get person'
        #.UT.expect ← 'get' 'person'
        Z ← #.Command.parse text
∇

:EndNameSpace