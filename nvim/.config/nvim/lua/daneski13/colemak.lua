require('daneski13.utils')

-- ==== Colemak ====
--      ^
--      u
-- < n  e  i >
--      v
noremap_s("n", "h")
noremap_s("e", "j")
noremap_s("u", "k")
noremap_s("i", "l")
noremap_s([[gu]], [[gk]])
noremap_s([[ge]], [[gj]])

-- end current word
noremap_s("h", "e")
noremap_s("H", "E")

-- next key for searching
noremap_s("j", "n")
noremap_s("J", "N")

-- insert key
noremap_s("k", "i")
noremap_s("K", "I")

-- undo
noremap_s("l", "u")
noremap_s("L", "U")

-- faster up/down nav
noremap_s("U", "5kzz")
noremap_s("E", "5jzz")
-- start line
noremap_s("N", "0")
-- end line
noremap_s("I", "$")

-- Moves the selected line down one
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
-- Moves the selected line up one
vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv")
