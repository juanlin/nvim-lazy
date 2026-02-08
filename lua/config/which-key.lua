local wk = require('which-key')
wk.add({
  -- name group keys
  { '<leader>f', group = 'Telescope' },
  -- register as group with more subsequent keys
  { '<leader>w', proxy = '<C-w>' },
})

-- Handle <Leader>w registered as one key (when hit quickly)
local function myfunc()
  wk.show({ keys = '<C-w>', loop = false, delay = 0, })
end
vim.keymap.set('n', '<leader>w', myfunc, { desc = 'Window commands' })
