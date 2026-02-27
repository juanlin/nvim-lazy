return {
  'juanlin/which-key.nvim',
  opts = {
    delay = 250,
    spec = {
      -- Name group keys
      { '<leader>f', group = 'Telescope' },
      { 'gs', group = 'Surround', mode = { 'n', 'x' } },

      -- Hide mappings for cleaner menus
      { '<leader>P', hidden = true, mode = { 'n', 'x' } },
      { '<leader>E', hidden = true },
      { '<C-w>d', hidden = true },
      { '<C-w><C-d>', hidden = true },

      -- Set as proxy to <C-w> (do not map elsewhere to avoid issues)
      { '<leader>w', proxy = '<C-w>', group = 'Window commands' },

      -- Assign custom icons to keymaps
      { '<leader>y', icon = '', mode = { 'n', 'x' } },
      { '<leader>p', icon = '', mode = { 'n', 'x' } },
      { '<leader>e', icon = { icon = '󰈔', color = 'cyan' } },
    },
    preset = 'helix', -- classic, modern, helix
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- Pressing <Space> enters Sticky mode (Hydra mode)
    vim.keymap.set('n', '<C-w><Space>', function()
      wk.show({ keys = '<C-w>', loop = true, })
    end, { desc = 'Sticky Mode' })
  end
}
