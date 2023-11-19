return {
    -- colorscheme
    {
        "deparr/tairiki.nvim",
        lazy = false,
        priority = 1000,
    },

    -- LSP
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim" },

    -- auto complete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lua",
            "lukas-reineke/cmp-rg",
        },
    },

    -- syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- formatting
    { "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } },

    -- linting
    { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },

    -- telescope fzf
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- dressing.nvim for better ui for vim.ui.input/.select
    { "stevearc/dressing.nvim" },

    -- for easy commenting of lines and such
    { "numToStr/Comment.nvim" },

    -- my status line of choice
    {
        "nvim-lualine/lualine.nvim",
        dependecies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Auto cmp on (), [], {} and html tags!
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    { "windwp/nvim-ts-autotag" },
}
