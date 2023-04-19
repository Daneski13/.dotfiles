if vim.g.vscode then return end

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Ensure servers
lsp.ensure_installed({
    'rust_analyzer',
})

-- nvim support for lua
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- completion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    -- mappings
    mapping = {
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    -- borders
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

-- on buffer only
lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- go to definition
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


-- lsp loader progress
require("fidget").setup {
    window = {
        -- make transparent
        blend = 0
    }
}
