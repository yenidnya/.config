vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp'
    }

    -- Tree
    use {
        'nvim-tree/nvim-tree.lua',
        'nvim-tree/nvim-web-devicons',
    }

    -- Theme
    use 'navarasu/onedark.nvim'

    -- Text edit
    use {
        'rmagatti/alternate-toggler',
        "windwp/nvim-autopairs",
        'mg979/vim-visual-multi',
        'gcmt/wildfire.vim',
        'tpope/vim-surround',
        'numToStr/Comment.nvim'
    }

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'MattesGroeger/vim-bookmarks'
    use 'tom-anders/telescope-vim-bookmarks.nvim'
    use 'ThePrimeagen/harpoon'

    -- Compilation
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'onsails/lspkind-nvim'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'jose-elias-alvarez/typescript.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'
    use 'axelvc/template-string.nvim'

    -- Dashboard
    use 'echasnovski/mini.starter'
    -- Misc
    use "folke/todo-comments.nvim"
    use "folke/zen-mode.nvim"
    use 'f-person/git-blame.nvim'
    use "folke/which-key.nvim"
    use "airblade/vim-gitgutter"
    use "tpope/vim-fugitive"
end)
