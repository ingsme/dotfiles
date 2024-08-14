return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- 'rcarriga/nvim-notify',
      'rcarriga/nvim-notify',
      'onsails/lspkind.nvim',
    },
    opts = {
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        -- view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {}, -- global options for the cmdline. See section on views
        -- format = {
        --   cmdline = { pattern = '^:', icon = '', lang = 'vim' },
        --   -- search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        --   -- search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        --   filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
        --   lua = { pattern = '^:%s*lua%s+', icon = '', lang = 'lua' },
        --   help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
        --   input = {}, -- Used by input()
        --   -- lua = false, -- to disable a format, set to `false`
        -- },
      },
      views = {
        cmdline_popup = {
          size = {
            height = 'auto',
            width = 'auto',
          },
          position = {
            row = '50%',
            col = '50%',
          },
        },
      },
      messages = {
        enabled = false, -- enables the Noice messages UI
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        backend = 'cmp', -- backend to use to show regular cmdline completions
        kind_icons = {}, -- set to `false` to disable icons
      },
      routes = {
        {
          filter = {
            event = 'notify',
            find = 'No information available',
          },
        },
      },
      presets = {
        command_palette = true,
        inc_rename = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
    },
    keys = {
      { '<leader>snt', '<cmd>Noice telescope<cr>', { desc = 'Noice Telscope' } },
      {
        '<leader>snl',
        function()
          require('noice').cmd('last')
        end,
        desc = 'Noice Last Message',
      },
      {
        '<leader>snh',
        function()
          require('noice').cmd('history')
        end,
        desc = 'Noice History',
      },
      {
        '<leader>sna',
        function()
          require('noice').cmd('all')
        end,
        desc = 'Noice All',
      },
      {
        '<leader>snd',
        function()
          require('noice').cmd('dismiss')
        end,
        desc = 'Dismiss All',
      },
    },
  },
}
