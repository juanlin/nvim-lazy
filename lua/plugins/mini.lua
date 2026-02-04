return {
  {
    'nvim-mini/mini.icons',
    version = false,  -- install from main branch
    config = function(_, opts)
      require('mini.icons').setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end
  },
  { -- Surround support
    'nvim-mini/mini.surround',
    version = false,
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
    opts = {},
  },
}
