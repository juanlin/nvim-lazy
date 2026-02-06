vim.g.mapleader = ' '

local map = vim.keymap.set
local nmap_leader = function(suffix, rhs, desc)
  map('n', '<leader>'..suffix, rhs, { desc = desc })
end

nmap_leader('e', '<Cmd>Ex<CR>', 'File Explorer')
nmap_leader('w', '<C-w>', '+Window commands')

-- Telescope, see telescope.lua

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right' })

map('n', '<Esc>', '<Cmd>nohlsearch<CR>')
