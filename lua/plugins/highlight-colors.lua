return  {
  -- Show CSS colors
  'brenoprata10/nvim-highlight-colors',
  opts = {
    render = 'foreground',  -- background, foreground, virtual
  },
  config = function(_, opts)
    local hlightColors = require('nvim-highlight-colors')
    hlightColors.setup(opts)
    hlightColors.turnOff()
  end,
  event = 'VeryLazy',
}
