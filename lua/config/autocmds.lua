-- Don't insert comment leader ever
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove{'c', 'r', 'o'}
  end
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  desc = 'Return cursor to last known position',
  command = 'silent! normal! g`"zv',
})
