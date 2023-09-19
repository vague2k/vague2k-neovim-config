return {
    {
------- Theme config --
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            -- setup must be called before loading the colorscheme
            -- These are all the default options set to my own tastes:
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "soft", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd([[ colorscheme gruvbox ]])

            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    },

------- LSP, auto cmp, and treesitter syntax highlighting --
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',

        'folke/neodev.nvim',
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',

            'hrsh7th/cmp-nvim-lsp',

        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

------- Telescope for easy file search & fzf --
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

------- For easy commenting of lines and such --
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

------- Transparent background if I ever want to toggle it --
    {
        'xiyaowong/nvim-transparent',
        config = function()
            require("transparent").setup {
            extra_groups = {
                    'NormalFloat',
                    'NvimTreeNormal'
                },
            }
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
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },

------- Auto cmp on (), [], {} -- 
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
}
