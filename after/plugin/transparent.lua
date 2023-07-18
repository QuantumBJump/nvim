require("transparent").setup({
    extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
    },
})

if vim.fn.has('wsl') == 1 then
    vim.cmd("TransparentEnable")
else
    vim.cmd("TransparentDisable")
end
