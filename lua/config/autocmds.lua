local general_settings = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  desc = "Don't auto-insert comments on new lines",
  group = general_settings,
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove{'c', 'r', 'o'}
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Return cursor to last known position',
  group = general_settings,
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype

    -- print(vim.inspect(ft))
    if ft:find('commit')
      or vim.tbl_contains({ 'xxd', 'gitrebase', 'tutor'}, ft)
      or vim.wo.diff
      or vim.fn.line('.') > 1 then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = general_settings,
  callback = function()
    vim.hl.on_yank({
      -- timeout = 300,
    })
  end,
})
