-- see :h lsp-quickstart
return {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
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
