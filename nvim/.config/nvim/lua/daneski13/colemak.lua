local utils = require("daneski13.utils")

-- I chose to remap nav keys for colemak back to QWERTY placement,
-- keeps muscle memory and the whole piont of the original nav key
-- placment was for homerow navigation. Untofortunatly, some pneumonics
-- are lost (n for next, e for end word, and i for insert), but I think
-- it's worth it for comfortable navigation.

-- ==== Colemak mod DH ====
utils.noremap_s("m", "h")
utils.noremap_s("n", "j")
utils.noremap_s("e", "k")
utils.noremap_s("i", "l")
utils.noremap_s([[ge]], [[gk]])
utils.noremap_s([[gn]], [[gj]])

-- window nav using bindngs
utils.noremap_s("<leader>wm", "<C-w>h")
utils.noremap_s("<leader>wn", "<C-w>j")
utils.noremap_s("<leader>we", "<C-w>k")
utils.noremap_s("<leader>wi", "<C-w>l")

-- end current word
utils.noremap_s("h", "e")
utils.noremap_s("H", "E")

-- next key for searching
utils.noremap_s("k", "n")
utils.noremap_s("K", "N")

-- insert key
-- don't want to use QWERTY i position to keep u (undo) pneumonic
-- + j needs a new mapping as it was replaced with n for nav
utils.noremap_s("j", "i")
utils.noremap_s("J", "I")

-- faster up/down nav, center
utils.noremap_s("E", "5kzz")
utils.noremap_s("N", "5jzz")
-- start line
utils.noremap_s("M", "0")
-- end line
utils.noremap_s("I", "$")

-- Moves the selected line down one
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
-- Moves the selected line up one
vim.keymap.set("v", "E", ":m '<-2<cr>gv=gv")
