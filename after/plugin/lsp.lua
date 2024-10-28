local lsp = require('lsp-zero')

lsp.preset('recommended')

local lua_opts = lsp.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }
})

require('luasnip.loaders.from_vscode').lazy_load()

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
    root_dir = function(fname)
        local go_mod = vim.fs.find('go.mod', { upward = true, path = vim.fs.dirname(fname) })[1]
        if go_mod then
            return vim.fs.dirname(go_mod)
        end
        local plzconfig = vim.fs.find('.plzconfig', { upward = true, path = vim.fs.dirname(fname) })[1]
        local src = vim.fs.find('src', { upward = true, path = vim.fs.dirname(fname) })[1]
        if plzconfig and src then
            vim.env.GOPATH = string.format('%s:%s/plz-out/go', vim.fs.dirname(src), vim.fs.dirname(plzconfig))
            vim.env.GO111MODULE = 'off'
        end
        return vim.fn.getcwd()
    end,
})
require('lspconfig').nil_ls.setup({})
require('lspconfig').nixd.setup({})
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
lsp.set_preferences({
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = 'go to definition' })
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = 'view references' })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {
        buffer = bufnr,
        remap = false,
        desc = 'show documentation'
    })
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
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {
        buffer = bufnr,
        remap = false,
        desc = 'rename'
    })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = 'signature help' })
    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end,
        { buffer = bufnr, remap = false, desc = 'format file' })
end)

-- Mason Setup
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',
        'lua_ls',
        'rust_analyzer',
    },
    handlers = {
        lsp.default_setup,
    },
})


lsp.setup()
