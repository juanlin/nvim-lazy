vim.lsp.enable({
  'lua_ls', 'rust_analyzer',
})

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
  callback = function(event)
    -- Easier LSP mappings
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under cursor
    map('grn', vim.lsp.buf.rename, 'Rename')

    -- Execute a code action
    map('gra', vim.lsp.buf.code_action, 'Goto Code Action', { 'n', 'x' })

    -- Goto Declaration (not goto definition!)
    map('grD', vim.lsp.buf.declaration, 'Goto Declaration')

    -- Autocomplete
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
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
