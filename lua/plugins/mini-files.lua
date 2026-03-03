local sfind = string.find

local filter_ignore = function(fs_entry)
  local ignorelist = { '.git', '.DS_Store' }
  return not vim.tbl_contains(ignorelist, fs_entry.name)
end

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
    content = {
      filter = filter_ignore,
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

    -- Set focused directory as current working directory
    local set_cwd = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then return vim.notify('Cursor is not on valid entry') end
      vim.fn.chdir(vim.fs.dirname(path))
      vim.notify('cwd set: ' .. vim.fs.dirname(path))
    end

    -- Create mapping to show/hide dot-files
    local show_dotfiles = true

    local filter_dot = function(fs_entry)
      local is_dot = vim.startswith(fs_entry.name, '.')
      local is_in_path = sfind(MiniFiles.get_fs_entry().path, fs_entry.path, 1, true) ~= nil
      return not is_dot or is_in_path
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = function(fs_entry)
        if not filter_ignore(fs_entry) then
          return false
        end
        return show_dotfiles or filter_dot(fs_entry)
      end
      MiniFiles.refresh({ content = { filter = new_filter } })
    end

    -- Actually bind keymaps to toggle hidden, split open, etc.
    local minifiles_settings = vim.api.nvim_create_augroup('miniFSetup', { clear = true })
    vim.api.nvim_create_autocmd('User', {
      group = minifiles_settings,
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, '<C-s>', 'horizontal')
        map_split(buf_id, '<C-v>', 'vertical')
        vim.keymap.set('n', 'g~', set_cwd, { buffer = buf_id, desc = 'Set cwd' })
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id, desc = 'Show/hide dotfiles' })
      end,
    })

    -- Set custom bookmarks
    local set_mark = function(id, path, desc)
      MiniFiles.set_bookmark(id, path, { desc = desc })
    end
    vim.api.nvim_create_autocmd('User', {
      group = minifiles_settings,
      pattern = 'MiniFilesExplorerOpen',
      callback = function()
        set_mark('c', '~/.config', 'Config')
        set_mark('d', '~/Downloads', 'Downloads')
      end,
    })
  end,
}
