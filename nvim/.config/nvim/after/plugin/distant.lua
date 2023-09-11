if vim.g.vscode then return end

local plugin = require('distant')
plugin:setup(
	{
		network = {
			timeout = {
				max = 1000
			}
		}
	}
)
