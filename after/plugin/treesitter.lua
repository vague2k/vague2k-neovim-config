require('nvim-treesitter.install').compilers = { "clang", "gcc" }
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'python', 'go', 'tsx', 'sql', 'astro', 'css' },

    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },

    autotag = {
        enable = true,
    },
}
