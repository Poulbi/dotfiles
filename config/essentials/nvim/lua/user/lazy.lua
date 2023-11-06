local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Example using a list of specs with the default options
    "folke/which-key.nvim",

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-media-files.nvim",

    "nvim-telescope/telescope-symbols.nvim",
    "theprimeagen/harpoon",

    -- colors
    "shaunsingh/nord.nvim",
    { 'uZer/pywal16.nvim',                        name = 'pywal16' },
    "norcalli/nvim-colorizer.lua",

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    "nvim-treesitter/playground",

    -- syntax
    "sheerun/vim-polyglot",
    "theRealCarneiro/hyprland-vim-syntax",

    "mbbill/undotree",

    "tpope/vim-capslock",
    "tpope/vim-commentary",
    -- "tpope/vim-endwise",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "tpope/vim-vinegar",
    "m4xshen/autoclose.nvim",

    "christoomey/vim-tmux-navigator",

    -- utils
    "godlygeek/tabular",
    "renerocksai/calendar-vim",
    "ojroques/vim-oscyank",
    "potamides/pantran.nvim",
    "alx741/vinfo",

    -- "github/copilot.vim",
    --
    {
        'https://gitlab.com/itaranto/plantuml.nvim',
        config = function() require('plantuml').setup() end
    },

    -- objects
    "michaeljsmith/vim-indent-object",

    -- completion
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "alvan/vim-closetag",

    -- debugging
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap" } },

    -- java
    "mfussenegger/nvim-jdtls",

    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- notes
    "renerocksai/telekasten.nvim",

})
