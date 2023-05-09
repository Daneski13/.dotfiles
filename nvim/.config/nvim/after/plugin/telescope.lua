if vim.g.vscode then return end

local builtin = require("telescope.builtin")
-- "Find file" get all the files in the project
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- "Find buffers"
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- "Find help"
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- "Find Old" files
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

-- "Find git" Only the files in git (respects .gitignore)
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- "Find Grep" grep/find files with input
vim.keymap.set('n', '<leader>fg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
