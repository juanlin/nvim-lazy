vim.g.mapleader = ' '
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus on right window' })
