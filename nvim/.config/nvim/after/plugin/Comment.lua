require('Comment').setup()

-- Toggle line wise comment, Opt/Alt + /
vim.keymap.set({ 'n', 'i' }, '÷', function()
	require("Comment.api").toggle.linewise.current()
	-- if the mode is insert, go to the end of the line
	if vim.fn.mode() == 'i' then
		vim.cmd('stopinsert')
		vim.api.nvim_feedkeys("A", 'n', true)
	end
end)
vim.keymap.set('v', '÷', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Toggle block comment, Opt/Alt + .
vim.keymap.set({ 'n', 'i' }, '≥', function()
	require("Comment.api").toggle.blockwise.current()
end)
vim.keymap.set('v', '≥', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>")
