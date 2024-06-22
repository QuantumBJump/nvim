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
vim.keymap.set('n', '<leader>ft', ":Neotree reveal left<CR>", { noremap = true, desc = 'toggle file tree' })
vim.keymap.set('n', '<leader>fb', ":Telescope file_browser <CR>", { desc = 'telescope file browser' })

-- Center screen after jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- J and K move line/selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Best remap ever: yank to + buffer
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- toggle checkboxes
vim.keymap.set('n', '<leader>tt', ":lua require('toggle-checkbox').toggle()<CR>")
