return {
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        -- Theme config --
        'ramojus/mellifluous.nvim',
        priority = 1000,
        config = function()
            require('mellifluous').setup({
                dim_inactive = false,
                color_set = 'mellifluous',
                styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
                    comments = { italic = true },
                    conditionals = {},
                    folds = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                transparent_background = {
                    enabled = true,
                    floating_windows = true,
                    telescope = true,
                    file_tree = true,
                    cursor_line = true,
                    status_line = false,
                },
                plugins = {
                    cmp = true,
                    gitsigns = true,
                    indent_blankline = true,
                    nvim_tree = {
                        enabled = true,
                        show_root = true,
                    },
                    telescope = {
                        enabled = true,
                        nvchad_like = true,
                    },
                    startify = true,
                },
            })

            vim.cmd([[ colorscheme mellifluous ]])

            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    },
    {
        -- I have a background on my terminal, set at low transparency
        -- If you don't, I wouldn't reccommend installing this plugin
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
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },
}
