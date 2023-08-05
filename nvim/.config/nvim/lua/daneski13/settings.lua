HOME = os.getenv("HOME")

-- ======== Behaviors ========

-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- auto indenting
vim.opt.smartindent = true

-- no line wrap
vim.opt.wrap = false

-- search, no highlight and allow incremental
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- set list
vim.opt.listchars = {
	tab = " ",
	trail = "·",
	space = "·",
	eol = "↲",
	extends = "❯",
	precedes = "❮",
}

-- always have at least 8 from bottom of screen
vim.opt.scrolloff = 8

-- change updatetime for cursorhold
vim.opt.updatetime = 1000

-- always show sign col
vim.opt.signcolumn = "yes"

-- file names
vim.opt.isfname:append("@-@")
