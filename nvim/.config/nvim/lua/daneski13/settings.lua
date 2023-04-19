HOME = os.getenv("HOME")

-- ======== Behaviors ========

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- auto indenting
vim.opt.smartindent = true

-- no line wrap
vim.opt.wrap = false

-- search, no highlight and allow incremental
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- always have at least 8 from bottom of screen
vim.opt.scrolloff = 8

-- always show sign col
vim.opt.signcolumn = "yes"

-- file names
vim.opt.isfname:append("@-@")
