local utils = require("daneski13.utils")

-- ==== Colemak ====
--      ^
--      u
-- < n  e  i >
--      v
utils.noremap_s("n", "h")
utils.noremap_s("e", "j")
utils.noremap_s("u", "k")
utils.noremap_s("i", "l")
utils.noremap_s([[gu]], [[gk]])
utils.noremap_s([[ge]], [[gj]])


-- window nav using bindngs
utils.noremap_s("<leader>wn", "<C-w>h")
utils.noremap_s("<leader>we", "<C-w>j")
utils.noremap_s("<leader>wu", "<C-w>k")
utils.noremap_s("<leader>wi", "<C-w>l")

-- end current word
utils.noremap_s("h", "e")
utils.noremap_s("H", "E")

-- next key for searching
utils.noremap_s("k", "n")
utils.noremap_s("K", "N")

-- insert key
utils.noremap_s("j", "i")
utils.noremap_s("J", "I")

-- undo
utils.noremap_s("l", "u")
utils.noremap_s("L", "U")

-- faster up/down nav
utils.noremap_s("U", "5kzz")
utils.noremap_s("E", "5jzz")
-- start line
utils.noremap_s("N", "0")
-- end line
utils.noremap_s("I", "$")

-- Moves the selected line down one
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
-- Moves the selected line up one
vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv")
