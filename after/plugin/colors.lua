function ColorMyPencils(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("tokyonight").setup {
    style = "moon",
    transparent = false,
    on_colors = function(colors)
        colors.comment = "#636da6"
    end,
    on_highlights = function(hl, c)
        hl.LineNr = {
            bg = c.bg,
            fg = "#6666aa"
        }
        hl.CursorLineNr = {
            bg = c.bg,
            fg = "#6666ff"
        }
    end
}
require('colorizer').setup()

-- Uncomment if you want the background to be seethrough by default
-- ColorMyPencils()
