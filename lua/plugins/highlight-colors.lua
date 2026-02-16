return  {
  -- Show CSS colors
  'brenoprata10/nvim-highlight-colors',
  opts = {
    render = 'virtual',  -- background, foreground, virtual
    virtual_symbol_position = 'eol' -- inline, eol, eow
  },
  config = function(_, opts)
    local hlc = require('nvim-highlight-colors')
    hlc.setup(opts)
    hlc.turnOff()
  end,
  keys = {
    { '<leader>c',
      '<Cmd>HighlightColors Toggle<CR>',
      desc = 'Toggle CSS colors',
    },
  },
}
