vim.lsp.enable({
  'luals',
})

vim.o.winborder = 'rounded'

vim.diagnostic.config({
  virtual_lines = true,
})

local lsp_autocmp = vim.api.nvim_create_augroup('LspAutocompletion', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_autocmp,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd('set completeopt+=noselect')
