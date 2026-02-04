return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-mini/mini.icons' },
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
    vim.opt.showmode = false  -- hide mode notification
  end
}
