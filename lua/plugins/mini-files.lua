return {
  'nvim-mini/mini.files',
  version = false,
  opts = {
    windows = {
      -- Enable preview and set to same width as focus
      preview = true,
      width_preview = 50,
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files',
    },
    {
      '<leader>E',
      function()
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
}
