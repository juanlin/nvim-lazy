return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local ts = require('nvim-treesitter')

    local languages = {
      'lua', 'rust', 'python', 'go',
      'typescript', 'tsx', 'javascript', 'css',
      'regex', 'markdown',
    }
    ts.install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function()
        -- Syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- Indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

  end
}
