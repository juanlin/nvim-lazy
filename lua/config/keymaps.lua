vim.g.mapleader = ' '
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to the down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to the up window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to the right window' })
