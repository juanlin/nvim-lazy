return {
  'juanlin/which-key.nvim',
  opts = {
    delay = 250,
    spec = {
      -- name group keys
      { '<leader>f', group = 'Telescope' },
      { 'gs', group = 'Surround', mode = { 'n', 'v' } },

      -- set as proxy to <C-w> (do not map elsewhere to avoid issues)
      { '<leader>w', proxy = '<C-w>', group = 'Window commands' },
    },
    preset = 'helix', -- classic, modern, helix
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    vim.keymap.set('n', '<C-w><Space>', function()
      wk.show({ keys = '<C-w>', loop = true, })
    end, { desc = 'Sticky Mode' })
  end
}
