-- Functional wrapper for mapping custom keybindings
function noremap_s(shortcut, command)
	vim.keymap.set({ "n", "v" }, shortcut, command, { noremap = true, silent = true })
end
