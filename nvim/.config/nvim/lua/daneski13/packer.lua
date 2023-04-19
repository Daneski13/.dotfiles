-- ====== PACKER ======
-- Just in case, make sure the packpath is set properly
vim.cmd([[set packpath+=~/.local/share/nvim/site/pack/*/start]])

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    -- Packer itself
    use('wbthomason/packer.nvim')

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color scheme
    use("olimorris/onedarkpro.nvim")

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mrjones2014/nvim-ts-rainbow')

    -- Game to git good
    use('theprimeagen/vim-be-good')

    -- harpoon
    use('theprimeagen/harpoon')
    -- undo tree
    use('mbbill/undotree')

    -- git integration
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')
    use('lewis6991/gitsigns.nvim')

    -- proper tab width/space width
    use('tpope/vim-sleuth')

    -- commenting
    use { 'numToStr/Comment.nvim', }

    -- startup dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- LSP/Completion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    -- LSP progress
    use { 'j-hui/fidget.nvim',
        config = function()
            require("fidget").setup {}
        end
    }
    -- Completion in vim cmd
    use { 'gelguy/wilder.nvim' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
