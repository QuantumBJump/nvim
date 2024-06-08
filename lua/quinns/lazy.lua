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
        tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim'
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end,
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
                    tabline = true,
                    mark_branch = true,
                })
        end
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2',
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
    }
})
