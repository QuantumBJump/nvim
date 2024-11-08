require("transparent").setup({
    extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
    },
})

-- only enable transparency if running on WSL - acrylic looks pretty
vim.cmd("TransparentEnable")
