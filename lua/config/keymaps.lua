local map = vim.keymap.set

vim.g.mapleader = ' '
map('n', '<leader>e', '<Cmd>Ex<CR>', { desc = 'File Explorer' })
map('n', '<leader>w', '<C-w>', { desc = 'window', })

-- Telescope
map('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = 'Find File' })
map('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', { desc = 'Live Grep' })
map('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', { desc = 'Buffers' })

map('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to the left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to the down window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to the up window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to the right window' })
