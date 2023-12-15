return {
    -- colorscheme
    {
        "AlexvZyl/nordic.nvim",
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
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "rafamadriz/friendly-snippets",
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

    -- color highlighting
    { "norcalli/nvim-colorizer.lua" },

    -- tailwind specific plugsins, sort classes and color highlighting
    {
        "laytan/tailwind-sorter.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
        build = "cd formatter && npm i && npm run build",
        config = true,
    },
    { "themaxmarchuk/tailwindcss-colors.nvim" },
    { "NTBBloodbath/color-converter.nvim" },
}
