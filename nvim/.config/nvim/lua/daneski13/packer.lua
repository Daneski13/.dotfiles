-- ====== PACKER ======
-- Just in case, make sure the packpath is set properly
vim.cmd([[set packpath+=~/.local/share/nvim/site/pack/*/start]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	-- Packer itself
	use("wbthomason/packer.nvim")

	-- distant (ssh editing)
	use {
		'chipsenkbeil/distant.nvim',
		branch = 'v0.3',
	}


	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',

		requires = {
			{ "nvim-lua/plenary.nvim" },
			-- use lua fzf
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			-- replace some core stuff with telescope
			{ 'nvim-telescope/telescope-ui-select.nvim' }
		},
	})

	-- buffer edit file system (replace netrw)
	use({ "stevearc/oil.nvim" })
	-- but sometimes I want a file tree explorer
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Color scheme
	use("olimorris/onedarkpro.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/playground" },
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
	})
	-- rainbow parens
	use("HiPhish/nvim-ts-rainbow2")
	--  auto tag
	use("windwp/nvim-ts-autotag")
	-- auto pairs
	use("windwp/nvim-autopairs")
	-- souround stuff with parrns, brackets, etc
	use("machakann/vim-sandwich")
	use("tpope/vim-surround")

	-- multiline edit
	use("mg979/vim-visual-multi")

	-- Game to git good
	use("theprimeagen/vim-be-good")

	-- harpoon
	use("theprimeagen/harpoon")

	-- undo tree
	use("mbbill/undotree")

	-- git integration
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("lewis6991/gitsigns.nvim")

	-- automagic tab width/space width for project
	use("tpope/vim-sleuth")

	-- commenting
	use({ "numToStr/Comment.nvim" })

	-- startup dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- project root
	use({ "airblade/vim-rooter" })

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP/Completion
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },

			-- Github copilot
			{ "zbirenbaum/copilot.lua" },

			-- Formatting stuff
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },

			-- code actions lightbulb
			{ "kosayoda/nvim-lightbulb" },
		},
	})
	--  proper completion for neovim lua
	use({
		"folke/lua-dev.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
		},
	})
	-- LSP progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	-- Completion in vim cmd
	use({
		"gelguy/wilder.nvim",
		build = ":UpdateRemotePlugins",
		requires = {
			{ "romgrk/fzy-lua-native" },
			{ "roxma/nvim-yarp" },
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
