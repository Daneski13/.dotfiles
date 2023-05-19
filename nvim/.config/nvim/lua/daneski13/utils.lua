local M = {}
-- Functional wrapper for mapping custom keybindings
function M.noremap_s(shortcut, command)
	vim.keymap.set({ "n", "v" }, shortcut, command, { noremap = true, silent = true })
end

-- returns the number of windows in the current tab, excluding floating and relative windows
function M.getWindowCount()
	local count = 0
	local tab_wins = vim.api.nvim_tabpage_list_wins(0)
	for _, winid in ipairs(tab_wins) do
		local config = vim.api.nvim_win_get_config(winid)
		if not (config.relative or config.floating) then
			count = count + 1
		end
	end
	return count
end

return M
