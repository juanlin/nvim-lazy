return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',

  opts = {
    ensure_installed = {
      'lua', 'rust', 'python', 'go',
      'typescript', 'tsx', 'javascript',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    folds = { enable = true },
  },
}
