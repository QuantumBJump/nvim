-- Buffer Trouble commands
vim.keymap.set('n', '<leader>xt', "<cmd>Trouble todo filter.buf=0<cr>",
    { desc = "File TODOs (Trouble)" })
vim.keymap.set('n', '<leader>xd', "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    { desc = "File diagnostics (Trouble)" })
vim.keymap.set('n', '<leader>xl', "<cmd>Trouble loclist toggle<cr>",
    { desc = "Location list (Trouble)" })
vim.keymap.set('n', '<leader>xq', "<cmd>Trouble qflist toggle<cr>",
    { desc = "Quickfix list (Trouble)" })
vim.keymap.set('n', '<leader>xc', "<cmd>Trouble todo filter = { tag = { TODO,FIX,FIXME }, buf = 0 }<cr>",
    { desc = "Comment list (Trouble)" })


-- Basic Trouble commands
vim.keymap.set('n', '<leader>xT', "<cmd>Trouble todo<CR>", {desc = "Project TODOs (Trouble)"})
vim.keymap.set('n', '<leader>xD', "<cmd>Trouble diagnostics toggle<CR>", { desc = "Project diagnostics (Trouble)" })
vim.keymap.set('n', '<leader>xC', "<cmd>Trouble todo filter = { tag = { TODO,FIX,FIXME } }<cr>",
    { desc = "Project comment list (Trouble)" })

-- Trouble overview commands
vim.keymap.set('n', '<leader>os', "<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
    { desc = "Symbol overview (Trouble)" })
vim.keymap.set('n', '<leader>ol', "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions/references/... (Trouble)" })

