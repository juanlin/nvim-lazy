vim.g.mapleader = ' '

local map = vim.keymap.set

-- Leader keybinds
map('n', '<leader>e', '<Cmd>Ex<CR>', { desc = 'File Explorer' })
map('n', '<leader>w', '<C-w>', { desc = '+Window commands' })

-- Telescope, see telescope.lua

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right' })

-- Other
map('n', '<Esc>', '<Cmd>nohlsearch<CR>')
