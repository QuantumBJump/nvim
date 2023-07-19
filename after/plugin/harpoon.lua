local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require('harpoon.term')


vim.keymap.set("n", "<leader>a", mark.add_file, { desc = 'add file to Harpoon' })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = 'open Harpoon quick menu' })

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = 'open Harpoon file 1' })
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = 'open Harpoon file 2' })
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = 'open Harpoon file 3' })
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = 'open Harpoon file 4' })
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end, { desc = 'open Harpoon file 5' })
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end, { desc = 'open Harpoon file 6' })
vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end, { desc = 'open Harpoon file 7' })
vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end, { desc = 'open Harpoon file 8' })
vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end, { desc = 'open Harpoon file 9' })
vim.keymap.set("n", "<leader>h0", function() ui.nav_file(0) end, { desc = 'open Harpoon file 10' })

vim.keymap.set("n", "<leader>ht", function() term.gotoTerminal(1) end, { desc = 'Open terminal' })
