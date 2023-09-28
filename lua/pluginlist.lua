return {
    {
        ------- Theme config --
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            -- setup must be called before loading the colorscheme
            -- These are all the default options set to my own tastes:
            require('kanagawa').setup({
                keywordStyle = { italic = false },
                statementStyle = { bold = false },
                colors = {
                    theme = { dragon = { ui = { float = { 'none' } } }},
                },
            })
            vim.cmd([[ colorscheme kanagawa-dragon ]])

            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    },

------- LSP, auto cmp, and treesitter syntax highlighting --
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'antosha417/nvim-lsp-file-operations', config = true},
    {'folke/neodev.nvim'},
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-rg',

        },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', },

------- Telescope for easy file search & fzf --
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
    },

------- Dressing.nvim for better ui for vim.ui.input/.select
    { 'stevearc/dressing.nvim', },

------- For easy commenting of lines and such --
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

------- My status line of choice --
    {
        'nvim-lualine/lualine.nvim',
        dependecies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup({
                icons_enabled = true,
                theme = 'aurora',
            })
        end
    },

------- File tree -- 
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

------- Welcome screen for easy access to frequented files/dirs --
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },

------- Terminal emulator -- 
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

------- Auto cmp on (), [], {} and html tags! -- 
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { 'windwp/nvim-ts-autotag' }
}
