local wk = require('which-key')
wk.add({
  { '<leader>f', group = 'Telescope' },
  { '<leader>w', proxy = '<C-w>' }, -- show <C-w> popup for <leader>w
})

local function myfunc()
  wk.show({ keys = '<C-w>', loop = false, delay = 1000, })
end

-- Passing <C-w> directly will not trigger popup when hitting <leader>w
vim.keymap.set('n', '<leader>w', myfunc, { desc = 'window', })
