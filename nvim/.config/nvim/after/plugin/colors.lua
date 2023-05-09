if vim.g.vscode then return end

-- Color scheme
require('onedarkpro').setup({
	options = {
		transparency = true
	}
})
vim.cmd.colorscheme('onedark')

-- transparency
local t_groups = { -- table of groups to make transparent
	'Normal', 'NormalFloat'
}
for _, group in pairs(t_groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none" })
end
