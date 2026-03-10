return {
  { -- Icons support
    'nvim-mini/mini.icons',
    version = false,  -- install from main branch
    lazy = true,
    config = function(_, opts)
      require('mini.icons').setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end
  },
  { -- Surround keys
    'nvim-mini/mini.surround',
    version = false,
    event = 'VeryLazy',
    opts = {
      -- Add g- prefix to avoid clobbering (lazyvim)
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      },
    },
  },
  { -- Command line autocmp, autocorrect, peeking
    'nvim-mini/mini.cmdline',
    version = false,
    event = 'CmdlineEnter',
    opts = {},
  },
  { -- Draw vertical line on current scope
    'nvim-mini/mini.indentscope',
    version = false,
    event = 'VeryLazy',
    opts = {
      options = {
        -- Placing cursor on function header gets scope of body
        try_as_border = true,
      },
      symbol = '',
    },
  },
  { -- Pop-up notifications
    'nvim-mini/mini.notify',
    version = false,
    -- event = 'VeryLazy',
    opts = {},
  },
}
