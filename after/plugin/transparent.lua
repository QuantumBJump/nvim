require("transparent").setup({
    extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
    },
})

-- only enable transparency if running on WSL - acrylic looks pretty
if string.find(vim.loop.os_uname().version, "NixOS") == "NixOS" then
    vim.cmd("TransparentEnable")
end
if vim.fn.has('wsl') == 1 then
    vim.cmd("TransparentEnable")
else
    vim.cmd("TransparentDisable")
end
