return {
  'nvim-mini/mini.files',
  version = false,
  opts = {
    mappings = {
      -- Close explorer after opening files by default
      go_in_plus = 'l',
      go_in = 'L',
      -- Trim when going back by default
      go_out_plus = 'h',
      go_out = 'H',
    },
    options = {
      -- Trash at ~/.local/share/nvim/mini.files/trash
      permanent_delete = false,
    },
    windows = {
      -- Enable preview and set to same width as focus
      preview = true,
      width_preview = 50,
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files',
    },
    {
      '<leader>E',
      function()
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function(_, opts)
    require('mini.files').setup(opts)

    -- Create mappings to open files in new split
    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd('belowright ' .. direction .. ' split')
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)

        -- Open file and close minifiles
        MiniFiles.go_in({ close_on_file = true })
      end

      local desc = 'Open in ' .. direction .. ' split'
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, '<C-s>', 'horizontal')
        map_split(buf_id, '<C-v>', 'vertical')
      end,
    })
  end,
}
