return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      -- 'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      {
        'xiyaowong/telescope-emoji.nvim',
        config = function()
          require('telescope').load_extension('emoji')
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require('telescope').setup({
            extensions = {
              ['ui-select'] = {
                require('telescope.themes').get_dropdown({}),
              },
            },
          })
          require('telescope').load_extension('ui-select')
        end,
      },
    },
    -- stylua: ignore
    keys = {
      { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = 'Find files' },
      { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep' },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Buffers' },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Buffers' },
      { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = 'Help tags' },
      { '<leader>fk', "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = 'Find keymap' },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { '<leader>fe', "<cmd>Telescope emoji<cr>", desc = 'Find emojies' },
    },
    opts = function()
      local actions = require('telescope.actions')
      local open_with_trouble = function(...)
        return require('trouble.providers.telescope').open_with_trouble(...)
      end
      local open_selected_with_trouble = function(...)
        return require('trouble.providers.telescope').open_selected_with_trouble(...)
      end
      return {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == '' then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ['<c-t>'] = open_with_trouble,
              ['<a-t>'] = open_selected_with_trouble,
              ['<C-Down>'] = actions.cycle_history_next,
              ['<C-Up>'] = actions.cycle_history_prev,
              ['<C-f>'] = actions.preview_scrolling_down,
              ['<C-b>'] = actions.preview_scrolling_up,
            },
            n = {
              ['q'] = actions.close,
            },
          },
        },
      }
    end,
  },
}
