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

    local ts_settings = vim.api.nvim_create_augroup('TSSettings', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Set up nvim-treesitter highlighting and indentation',
      group = ts_settings,
      pattern = languages,
      callback = function()
        -- Syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- Indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- Folds using treesitter expr, provided by Neovim
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWinEnter' }, {
      desc = 'Open all folds upon opening file',
      group = ts_settings,
      pattern = '*',
      callback = function()
        vim.defer_fn(function()
          vim.cmd('normal! zR')
        end, 0) -- wait for TS to load
      end,
    })
  end
}
