return {
  { -- Git plugin
    'tpope/vim-fugitive',
  },
  { -- Smooth scrolling
    'karb94/neoscroll.nvim',
    opts = { duration_multiplier = 0.30, },
    event = 'VeryLazy',
  },
}
