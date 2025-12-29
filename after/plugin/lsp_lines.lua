local lsp_lines = require('lsp_lines')

vim.diagnostic.config({
    virtual_text=false,
    virtual_lines=true,
})
lsp_lines.setup()
