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
        },
      },
    },
  },
}
