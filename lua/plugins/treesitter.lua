return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local ts = require('nvim-treesitter')

    local ensure_installed = {
      'lua', 'rust', 'python', 'go',
      'typescript', 'tsx', 'javascript',
      'regex',
    }
    ts.install(ensure_installed)
  end
}
