if vim.g.vscode then return end

-- Color scheme
require('onedarkpro').setup({
	options = {
		transparency = true,
		terminal_colors = false,
	}
})
vim.cmd.colorscheme('onedark')

-- Treesitter context
vim.api.nvim_set_hl(0, 'TreesitterContext', { sp = 'Gray' })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { fg = '#FF7F50' })
vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underline = true, sp = 'Gray' })
