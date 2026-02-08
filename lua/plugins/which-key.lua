return {
  'folke/which-key.nvim',
  opts = {
    delay = 250,
    spec = {
      -- name group keys
      { '<leader>f', group = 'Telescope' },
      { 'gs', group = 'Surround', mode = { 'n', 'v' } },

      -- set as proxy to <C-w> (do not re-map to avoid issues)
      { '<leader>w', proxy = '<C-w>', group = 'Window commands' },
      -- adding desc explicitly allows <leader>wc to properly capture!
      { '<C-w>c', desc = 'Close window!' },
      -- ... but does not work for '<'
      { '<C-w><', desc = 'Decrease width!' },
    },
  },
}
