return {
  'nvim-telescope/telescope.nvim', version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-k>'] = function(...)
            return require('telescope.actions').move_selection_previous(...)
          end,
          ['<C-j>'] = function(...)
            return require('telescope.actions').move_selection_next(...)
          end,
          -- Escape key closes Telescope in Insert mode, bypass Normal
          ['<Esc>'] = function(...)
            return require('telescope.actions').close(...)
          end,
          -- Clear prompt on Ctrl-U
          ['<C-u>'] = false
        },
      },
    },
  },
  -- Lazy-load on command
  cmd = 'Telescope',
  -- Lazy-load on key
  keys = {
    { '<leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Find File' },
    { '<leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
    { '<leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
    { '<leader>fo', '<Cmd>Telescope oldfiles<CR>', desc = 'Oldfiles' },
  }
}
