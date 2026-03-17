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

vim.lsp.config("lua_ls", {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/luarc.jsonc')) then
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
})
vim.lsp.enable("lua_ls")

vim.lsp.config("gopls", {
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
})
vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-8")
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})


vim.lsp.config("nil_ls", {})
vim.lsp.enable("nil_ls")

vim.lsp.config("nixd", {})
vim.lsp.enable("nixd")

vim.lsp.config("elixirls", {
    cmd = {
        "elixir-ls"
    }
})
vim.lsp.enable("elixirls")

vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            },
            check = {
                command = "clippy",
            },
        }
    }
})
vim.lsp.enable("rust_analyzer")

-- vim.lsp.config("pyright",{})
vim.lsp.config("ty",{
    settings = {
        ty = {
            -- configuration = {
            --     rules = {
            --         ["unresolved-reference"] = "warn",
            --     }
            -- }
        }
    }
})
vim.lsp.enable("ty")

vim.lsp.config("ruff",{})
vim.lsp.enable("ruff")
--vim.api.nvim_create_autocmd("LspAttach", {
--    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_various', { clear = true }),
--    callback = function (args)
--        local client = vim.lsp.get_client_by_id(args.data.client_id)
--        if client == nil then
--            return
--        end
--        if client.name == 'ruff' then
--            --Disable hover in favour of Pyright
--            client.server_capabilities.hoverProvider = false
--        end
--    end,
--    desc = "LSP: Disable various ruff capabilities in favour of pyright",
--})

-- Terraform
vim.lsp.config("terraformls", {})
vim.lsp.enable("terraformls")
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   pattern = {"*.tf", "*.tfvars"},
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
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
        ['<C-b>'] = cmp.mapping(function(fallback)
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
