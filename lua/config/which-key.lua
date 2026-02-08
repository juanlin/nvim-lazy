local wk = require('which-key')
wk.add({
  -- name group keys
  { '<leader>f', group = 'Telescope' },
  { 'gs', group = 'Surround', mode = { 'n', 'v' } },
  -- set as proxy to <C-w> (do not re-map to avoid issues)
  { '<leader>w', proxy = '<C-w>', group = 'Window commands' },
})
