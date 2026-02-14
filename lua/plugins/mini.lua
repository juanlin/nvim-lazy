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
  { -- File system navigation popup
    'nvim-mini/mini.files',
    version = false,
    opts = {},
    keys = {
      { '<leader>e',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files',
      },
      { '<leader>E',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'Open mini.files (cwd)',
      },
    },
  },
}
