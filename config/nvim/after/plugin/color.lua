function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- require('solarized').set()
vim.g.solarized_italic_comments = false
vim.g.solarized_italic_keywords = false
vim.g.solarized_italic_functions = false
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = true
vim.g.solarized_borders = true
vim.g.solarized_disable_background = true
-- ColorMyPencils("solarized")

vim.cmd.colorscheme("nord")
