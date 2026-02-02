return {
  'folke/tokyonight.nvim',
  lazy = false, -- load during startup as my main colorscheme
  priority = 1000, -- load before all other start plugins
  opts = {
    style = 'moon', -- day, night, moon, storm
    transparent = true,
    -- lualine_bold = true,
    -- dim_inactive = true,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight'
  end
}
