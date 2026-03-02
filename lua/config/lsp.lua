vim.lsp.enable({
  'lua_ls',
})

vim.o.winborder = 'rounded'

local lsp_setup = vim.api.nvim_create_augroup('LspSetup', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_setup,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- Disable LSP semantic tokens, let nvim-treesitter handle coloring
    if client and client.server_capabilities.semanticTokensProvider then
      client.server_capabilities.semanticTokensProvider = nil
    end
    -- Enable autocompletion
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)
    end
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_lines = {
   -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})
