:NameSpace Command_tests

∇ Z ← separates_command_word_and_data_TEST
        text ← 'get person'
        #.UT.expect ← 'get' 'person'
        Z ← #.Command.parse text
∇

∇ Z ← trims_whitespaces_TEST
        text ← ' get person '
        #.UT.expect ← 'get' 'person'
        Z ← #.Command.parse text
∇

∇ Z ← lowercases_all_alphabetic_characters_TEST
        text ← 'GeT pErSoN'
        #.UT.expect ← 'get' 'person'
        Z ← #.Command.parse text
∇

:EndNameSpace