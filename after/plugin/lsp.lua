-- LSPCONFIG SETUP
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
local luasnip = require('luasnip')

-- This is where you enable features that only work if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local bufnr = event.buf
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = bufnr, remap = false, desc = 'go to definition' })
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
            { buffer = bufnr, remap = false, desc = 'view references' })
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
            { buffer = bufnr, remap = false, desc = 'view implementations' })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = bufnr, remap = false, desc = 'show documentation' })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = bufnr, remap = false, desc = 'view workspace symbols' })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = bufnr, remap = false, desc = 'view diagnostics' })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end,
            { buffer = bufnr, remap = false, desc = 'previous diagnostic' })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end,
            { buffer = bufnr, remap = false, desc = 'next diagnostic' })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = bufnr, remap = false, desc = 'view code actions' })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = bufnr, remap = false, desc = 'rename' })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = bufnr, remap = false, desc = 'signature help' })
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end,
            { buffer = bufnr, remap = false, desc = 'format file' })
    end,
})

-- LANGUAGE SERVER SETUP
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup{
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/luarc.jsonc')) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            directoryFilters = { '-plz-out' },
            analyses = {
                unusedparams = true,
            },
            usePlaceholders = true,
            semanticTokens = true,
            staticcheck = true,
        },
    },
    -- root_dir = function(startpath)
    --     if string.find(startpath, "plz%-out") then
    --         -- Separate branch, because otherwise it defaults to the repo root and becomes too slow
    --         return require('lspconfig/util').root_pattern(
    --             'go.mod',
    --             'go.work'
    --         )(startpath)
    --         else
    --             return require('lspconfig/util').root_pattern(
    --                 -- Order matters here
    --                 'BUILD',
    --                 'go.work',
    --                 'go.mod',
    --                 '.git'
    --             )(startpath)
    --         end
    --     end
})

require('lspconfig').nil_ls.setup({})

require('lspconfig').nixd.setup({})

require('lspconfig').elixirls.setup({
    cmd = {
        "elixir-ls"
    }
})

require('lspconfig').clangd.setup({})

require('lspconfig').rust_analyzer.setup{
   settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true;
            }
        }
   }
}

require('lspconfig').pylsp.setup({})

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'nvim_lsp_signature_help' },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function (fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    }),
})

-- Snippet jump settings
require('luasnip.loaders.from_vscode').lazy_load()

