local telescope = require('telescope')
local builtin = require('telescope.builtin')
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-n>"] = "preview_scrolling_up",
                ["<C-p>"] = "preview_scrolling_down",
            }
        }
    },
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			previewer = true,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
				n = {
					["d"] = "delete_buffer",
				},
			},
		},
	},
})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc='Telescope find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc='Telescope live grep'})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {desc='Telescope find buffer'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc='Telescope find help'})
vim.keymap.set('n', '<leader>fm', builtin.keymaps, {desc='Telescope find keymap'})
vim.keymap.set('n', '<leader>fv', ":Neotree reveal left<CR>", { noremap = true, desc = 'Telescope file browser' })

-- Git stuff
vim.keymap.set('n', '<leader>fs', builtin.git_files, {desc='Telescope git files'})
vim.keymap.set('n', '<leader>fcc', builtin.git_commits, {desc='Telescope git commits'})
vim.keymap.set('n', '<leader>fcb', builtin.git_bcommits, {desc='Telescope buffer commits'})
