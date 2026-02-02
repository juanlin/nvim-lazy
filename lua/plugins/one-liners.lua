return {
  { -- Git plugin
    'tpope/vim-fugitive',
  },
  { -- Show CSS colors, setting opts calls setup
    'brenoprata10/nvim-highlight-colors', opts = {}
  },
  { -- Show key hints
    'folke/which-key.nvim', opts = { delay = 1000 }
  },
  { -- Surround support
    'nvim-mini/mini.surround',
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
}
