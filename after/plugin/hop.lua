local hop = require('hop')

local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<Bslash>f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true, desc = 'Hop character forwards' })
vim.keymap.set('', '<Bslash>F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true, desc = 'Hop character backwards' })

-- w jumps forward words
vim.keymap.set('', '<Bslash>w', function()
    hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { remap = true, desc = "Hop forward words" })

-- b jumps backward words
vim.keymap.set('', '<Bslash>b', function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { remap = true, desc = 'Hop backward words' })

-- j & k to go up and down lines
vim.keymap.set('', '<Bslash>j', function()
    hop.hint_vertical({ direction = directions.AFTER_CURSOR })
end, { remap = true, desc = 'Hop down lines' })
vim.keymap.set('', '<Bslash>k', function()
    hop.hint_vertical({ direction = directions.BEFORE_CURSOR })
end, { remap = true, desc = 'Hop up lines' })

-- s to search for 2 chars
vim.keymap.set('', '<Bslash>s', function()
    hop.hint_char2()
end, { remap = true, desc = 'Hop to 2-char combo' })


hop.setup()
