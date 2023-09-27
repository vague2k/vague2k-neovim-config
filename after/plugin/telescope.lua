local telescope = require('telescope')

telescope.load_extension('fzf')

-- set telescope keymaps --
local keymap = function(mode, key, func, opts)
    vim.keymap.set(mode, key, func, opts)
end

local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>fg', builtin.live_grep, {})



