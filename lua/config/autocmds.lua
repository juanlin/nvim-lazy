local general_settings = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })

-- Don't auto-insert comments on new lines
vim.api.nvim_create_autocmd('FileType', {
  group = general_settings,
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove{'c', 'r', 'o'}
  end,
})

-- Return cursor to last known position
vim.api.nvim_create_autocmd('BufReadPost', {
  group = general_settings,
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    local ft = vim.bo.filetype
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Check if line has been specified via 'nvim file +xx'
    if current_line > 1 then
      return
    end

    -- Check if mark is valid and skip specific filetypes/diff mode
    if mark[1] > 0 and mark[1] <= lcount
       and ft ~= 'commit'
       and not vim.tbl_contains({ 'xxd', 'gitrebase', 'tutor' }, ft)
       and not vim.wo.diff then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})
