require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust', 'lua', 'javascript', 'c', 'vim', 'vimdoc', 'query', 'go', 'yaml', 'python' }

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
    callback = function(args)
        vim.schedule(function()
            local lang = vim.treesitter.language.get_lang(args.match)
            if not lang or not vim.treesitter.language.add(lang) then return end

            if vim.treesitter.query.get(lang, "highlights") then vim.treesitter.start(args.buf) end

            if vim.treesitter.query.get(lang, "indents") then
                vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
            end

            if vim.treesitter.query.get(lang, "folds") then
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            end
            vim.cmd "normal zR"
        end)
    end,
})
