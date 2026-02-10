require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lazy')
vim.lsp.enable({
  'luals',
})

vim.o.winborder = 'rounded'
