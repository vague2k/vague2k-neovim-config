local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- normal mode --
-- nvim-tree
keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', opts)

-- window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- insert mode --
-- press jk to escape insert quickly
keymap('i', 'jk', '<ESC>', opts)


-- visual mode --
-- stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- whatever you yank, stays persistent even if copied on top of another word 
keymap("v", "p", '"_dP', opts)

-- Yank whatever is selected onto the "clipboard" 
keymap("v", "<C-c>", '"+y', opts)








