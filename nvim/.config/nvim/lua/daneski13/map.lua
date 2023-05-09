require('daneski13.utils')
require('daneski13.colemak')

-- ======== Mappings ========
-- Leader key
vim.g.mapleader = " "

-- faster inline nav
noremap_s("W", "5w")
noremap_s("B", "5b")

-- select until end of line
noremap_s([[\v]], [[v$h]])

-- Change ~ to ` for flipping case
noremap_s("`", "~")

-- : to ;
vim.keymap.set({ "n", "v" }, ';', ':')

-- file exp, "Project View"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- delete highlighted word and past over from buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- delete to void buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Half a page down/up and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Ctrl + U or E will move up/down the view port without moving the cursor
-- vim.keymap.set({ "n", "v" }, "<C-U>", "5<C-y>")
-- vim.keymap.set({ "n", "v" }, "<C-E>", "5<C-e>")

-- format the current file
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- save the file
vim.keymap.set({ "n", "v" }, "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC><cmd>w<CR>a")

-- F5 to reload the keymap
vim.keymap.set("n", '<F5>', ':luafile ~/.config/nvim/init.lua<CR>')

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/daneski13/packer.lua<CR>");
