return {
  'nvim-mini/mini.files',
  version = false,
  opts = {
    mappings = {
      -- Close explorer after opening files by default
      go_in_plus = 'l',
      go_in = 'L',
      -- Trim when going back by default
      go_out_plus = 'h',
      go_out = 'H',
    },
    options = {
      -- Trash at ~/.local/share/nvim/mini.files/trash
      permanent_delete = false,
    },
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
