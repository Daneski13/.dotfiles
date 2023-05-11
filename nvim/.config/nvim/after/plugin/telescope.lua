if vim.g.vscode then return end

-- rooter setup
vim.g.rooter_patterns = { '.git', 'package.json', 'Cargo.toml', 'go.mod' }
vim.g.rooter_manual_only = 1
vim.g.rooter_cd_cmd = 'lcd'

-- exclude .git from telescope, .gitignore is respected already
require('telescope').setup({
	defaults = {
		file_ignore_patterns = { ".git" },
	},
})

-- load fzf extension
require('telescope').load_extension('fzf')

-- === Mappings ===
local builtin = require("telescope.builtin")
-- "Find file" returns all the files in the project
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({
		-- use rooter to attempt to find the root of the project, find files from there
		cwd = vim.fn.FindRootDirectory(),
		hidden = true,
	})
end, {})
-- "Find buffers"
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- "Find help"
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- "Find Old/Recent" files
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})

-- "Find git" Only the files in git (respects .gitignore)
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- "Find Grep" grep/find files with input
vim.keymap.set('n', '<leader>fG', function()
	builtin.grep_string({
		-- search hidden files as well, but ignore .git
		additional_args = function()
			return { '--hidden' }
		end,
		search = vim.fn.input("Grep > ")
	})
end)
