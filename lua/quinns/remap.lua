vim.g.mapleader = " "

vim.keymap.set("t", "<esc>", "<C-\\><C-N>") -- esc to leave insert mode in terminal

-- Move between panes using ctrl+hjkl

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = 'Jump window left' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = 'Jump window down' })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = 'Jump window up' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = 'Jump window right' })

-- Delete buffer
vim.keymap.set("n", "<leader>bd", ":bp <BAR> bd #<CR>", { desc = 'close current buffer'})

-- Comment out on \ /
vim.keymap.set("n", "<Bslash>/", ":Commentary<cr>", { desc = 'Comment out line' })

-- File View
vim.keymap.set('n', '<leader>fv', ":Ex<CR>", { noremap = true, desc = 'file tree' })
vim.keymap.set('n', '<leader>ft', ":Neotree reveal left toggle<CR>", { noremap = true, desc = 'toggle file tree' })
