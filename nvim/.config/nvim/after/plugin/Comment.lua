require('Comment').setup()

-- Toggle line wise comment
vim.keymap.set('n', '<leader>/', function()
    require("Comment.api").toggle.linewise.current()
end)
vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- toggle block comment
vim.keymap.set('n', '<leader>.', function()
    require("Comment.api").toggle.blockwise.current()
end)
vim.keymap.set('v', '<leader>.', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>")
