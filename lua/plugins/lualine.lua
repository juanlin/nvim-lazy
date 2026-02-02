return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    config = function(_, opts)
      require('lualine').setup(opts)
      vim.opt.showmode = false  -- hide mode notification
    end
  },
  {
    'nvim-mini/mini.icons',
    version = false,  -- install from main branch
    config = function(_, opts)
      require('mini.icons').setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end
  },
}
