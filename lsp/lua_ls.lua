-- see :h lsp-quickstart
-- equivalent to vim.lsp.config(...)
return {
  cmd = { 'lua-language-server' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }
      },
      signatureHelp = { enabled = true },
    },
  },
}
