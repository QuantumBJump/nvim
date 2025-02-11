-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable branch
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim'
        },
    },
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'alker0/chezmoi.vim',
        lazy = false,
        init = function()
            vim.g['chezmoi#use_tmp_buffer'] = true
        end,
    },
    'folke/tokyonight.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    'nvim-treesitter/playground',
    {
        'theprimeagen/harpoon',
        config = function()
            require('harpoon').setup(
                {
                    global_settings = {
                        tabline = true,
                    },
                })
        end
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/luasnip'},
    {'rafamadriz/friendly-snippets'},
    {
        'smoka7/hop.nvim',
        version = "v2.7.0",

    },
    'sedm0784/vim-resize-mode',
    'tpope/vim-commentary',
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },
    {
        'Shatur/neovim-session-manager',
        commit = '892c55f7256fe170301a1fdd21752982c75c3507',
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'airblade/vim-gitgutter',
    'xiyaowong/transparent.nvim',
    'norcalli/nvim-colorizer.lua',
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        -- ft = "markdown", -- Apply to all markdown files
        event = {
            -- Only apply to markdown files in obsidian vault
            "BufReadPre " .. vim.fn.expand "~" .. "/Documents/obsidian/**.md",
            "BufNewFile " .. vim.fn.expand "~" .. "/Documents/obsidian/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/obsidian/personal-wiki",
                },
                {
                    name = "DnDetectives",
                    path = "~/Documents/obsidian/DnDetectives",
                },
            },

            -- see below for full list of options 👇
        },
    },
    'opdavies/toggle-checkbox.nvim',
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
})
