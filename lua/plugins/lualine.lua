local function initials(mode)
  local i = mode:find('-', 1, true)
  if i and i < #mode then
    return mode:sub(1, 1) .. '-' .. mode:sub(i+1, i+1)
  end
  return mode:sub(1, 1)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-mini/mini.icons' },
  event = 'VeryLazy',
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      refresh = {
        statusline = 25,  -- default 100ms
      }
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(str)
            if vim.api.nvim_win_get_width(0) > 70 then
              return str
            end
            return initials(str)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
    vim.opt.showmode = false  -- hide mode notification
  end
}
