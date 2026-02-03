local wk = require('which-key')
wk.add({
  { '<leader>f', group = 'Telescope' },
  { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Find File' },
  { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
  { '<leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
  { '<leader>w', proxy = '<C-w>' }, -- show <C-w> popup when <leader>w
})
