local telescope = require('telescope')
local builtin = require('telescope.builtin')
telescope.setup({
    extensions = {
        ["ui-select"] = {}
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--multiline",
        },
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
        find_files = {
            hidden = true,
            file_ignore_patterns = {
                "%.git$",
            },
        }
    },
})
telescope.load_extension('ui-select')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Telescope find buffer' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope find help' })
vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Telescope find keymap' })

-- Git stuff
vim.keymap.set('n', '<leader>fs', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fcc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>fcb', builtin.git_bcommits, { desc = 'Telescope buffer commits' })
