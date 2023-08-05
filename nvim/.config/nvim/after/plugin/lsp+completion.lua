if vim.g.vscode then
	return
end

-- === LSP ===

-- neodev
require("neodev").setup({})

-- LSP zero
local lsp = require("lsp-zero")
lsp.preset({})

local lspconfig = require("lspconfig")

-- Ensure servers
lsp.ensure_installed({
	"rust_analyzer",
})

-- nvim support for lua
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- bash/zsh
lspconfig.bashls.setup({
	filetypes = { "sh", "zsh" },
})

-- === Completion ===
-- copilot
vim.g.copilot_assume_mapped = true
require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
	},
	filetypes = {
		["*"] = true,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
})

-- === CMP ===
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	-- mappings
	mapping = {
		-- use tab for both copilot and cmp, when copilot is visible accept, otherwise select next item on cmp. Remember arrow keys still work on cmp
		["<Tab>"] = cmp.mapping(function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			elseif cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			elseif require("luasnip").expandable() then
				require("luasnip").expand()
			else
				fallback()
			end
		end),
		-- use shift+tab for both copilot and cmp, when copilot is visible accept word, otherwise select previous item on cmp
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept_word()
			elseif cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			else
				fallback()
			end
		end),
		-- Accept with Enter
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Reject, "No" with Alt/Opt + N (shift n)
		["˜"] = cmp.mapping(function()
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").dismiss()
			end
			if cmp.visible() then
				cmp.close()
			end
		end),
		-- Scroll Complete Menu
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	},

	-- snippet
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer",  keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "path" },
		{ name = "nvim_lua" },
	},

	-- borders
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- on buffer only
local builtin = require("telescope.builtin")
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- format on save
	lsp.buffer_autoformat()

	-- go to definition, declaration, implementation, references
	vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, opts)
	vim.keymap.set("n", "<leader>gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, opts)
	vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)

	-- remap CTRL+O/CTRL+I to go back/forward in jump list
	vim.keymap.set("n", "<leader>gb", "<C-o>")
	vim.keymap.set("n", "<leader>gB", "<C-i>")


	-- "symbol rename"
	vim.keymap.set("n", "<leader>srn", function()
		vim.lsp.buf.rename()
	end, opts)
	-- "symbol hover"
	vim.keymap.set("n", "<leader>sh", function()
		vim.lsp.buf.hover()
	end, opts)

	-- signature help
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	-- diagnostics
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "[]d", builtin.diagnostics, opts)
	-- "view diagnostics"
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)

	-- "view code action"
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
end)

lsp.setup()

-- === Formatting/ null-lsp ===
require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
		"autopep8",
	},
	automatic_setup = true,
	automatic_installation = false,
	handlers = {},
})
require("null-ls").setup({
	sources = {
		-- Anything not supported by mason.
	}
})

-- lsp loader progress
require("fidget").setup({
	window = {
		-- make transparent
		blend = 0,
	},
})
