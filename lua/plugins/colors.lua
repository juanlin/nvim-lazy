return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'macchiato',  -- latte, frappe, macchiato, mocha
    transparent_background = true,
    -- auto_integrations = true,
    integrations = {
      mini = {
        indentscope_color = 'yellow',
      },
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end
}
