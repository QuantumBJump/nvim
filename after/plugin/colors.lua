function ColorMyPencils(color)
	color = color or "tokyonight-moon"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
require("tokyonight").setup{ transparent = vim.g.transparent_enabled}

-- Uncomment if you want the background to be seethrough by default
-- ColorMyPencils()
