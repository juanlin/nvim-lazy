vim.g.mapleader = ' '

local map = vim.keymap.set

-- Leader keybinds
map('n', '<leader>e', '<Cmd>Ex<CR>', { desc = 'File Explorer' })
map('n', '<leader>c', '<Cmd>HighlightColors Toggle<CR>', { desc = 'Toggle CSS colors' })

-- Telescope, see telescope.lua

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right' })

-- Easier interaction with the system clipboard
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to Clipboard' })
map({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste Clipboard' })
map({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste Clipboard before' })

-- Other
map('n', '<Esc>', '<Cmd>nohlsearch<CR>')
