if vim.g.vscode then return end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- mark a file for harpoon, "add"
vim.keymap.set("n", "<leader>a", mark.add_file)
-- quick toggle menu "harpoon menu"
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

-- Toggle between files using left hand Colemak home + Alt/Opt
vim.keymap.set("n", "†", function() ui.nav_file(1) end)
vim.keymap.set("n", "ß", function() ui.nav_file(2) end)
vim.keymap.set("n", "®", function() ui.nav_file(3) end)
vim.keymap.set("n", "å", function() ui.nav_file(4) end)
