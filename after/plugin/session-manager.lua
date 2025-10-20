local Path = require('plenary.path')
local config = require('session_manager.config')
require('session_manager').setup({
    -- autoload_mode = config.AutoloadMode.CurrentDir,
    autoload_mode = config.AutoloadMode.Disabled,
})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {})

vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = "SessionSavePre",
    group = config_group,
    callback = function()
        vim.cmd("Neotree close")
    end
})

vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = "SessionLoadPost",
    group = config_group,
    callback = function()
    end
})
