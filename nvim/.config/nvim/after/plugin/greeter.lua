if vim.g.vscode then return end

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"    ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓  ",
	"    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒  ",
	"   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░  ",
	"   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██   ",
	"   ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒  ",
	"   ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░  ",
	"   ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░  ",
	"      ░   ░ ░     ░░   ▒ ░░      ░     ",
	"            ░      ░   ░         ░     ",
	"                  ░                    "
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", ":cd $PROJECTS | Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("b", "  > Buffers", ":Telescope buffers<CR>"),
	dashboard.button("x", "  > File Explorer", ":Ex<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {

}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
