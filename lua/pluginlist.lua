return {
    {
        ------- Theme config --
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            -- setup must be called before loading the colorscheme
            -- These are all the default options set to my own tastes:
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = false },
                statementStyle = { bold = false },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                theme = "dragon",            -- Load "dragon" theme when 'background' option is not set
                background = {               -- map the value of 'background' option to a theme
                    dark = "dragon",         -- try "dragon" !
                    light = "lotus"
                },
            })
            vim.cmd([[ colorscheme kanagawa]])

            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    },

------- LSP, auto cmp, and treesitter syntax highlighting --
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
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-rg',

        },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', },

------- Telescope for easy file search & fzf --
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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

------- Transparent background if I ever want to toggle it --
    -- {
    --     'xiyaowong/nvim-transparent',
    --     config = function()
    --         require("transparent").setup {
    --         extra_groups = {
    --                 'NormalFloat',
    --                 'NvimTreeNormal'
    --             },
    --         }
    --     end
    -- },

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
