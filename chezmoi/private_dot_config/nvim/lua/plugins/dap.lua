if true then
  return {}
end
return {
  {
    -- https://github.com/rcarriga/nvim-dap-ui
    'rcarriga/nvim-dap-ui',
    -- event = 'VeryLazy',
    lazy = true,
    dependencies = {
      -- https://github.com/mfussenegger/nvim-dap
      'mfussenegger/nvim-dap',
      -- https://github.com/theHamsta/nvim-dap-virtual-text
      'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
      -- https://github.com/nvim-telescope/telescope-dap.nvim
      'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
      'mfussenegger/nvim-dap-python',
    },
    keys = {
      { '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = 'Toggle breakpoint' },
      {
        '<leader>bc',
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        desc = 'Set breakpoint (Condition)',
      },
      {
        '<leader>bl',
        "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
        { desc = 'Set breakpoint (Log)' },
      },
      { '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", desc = 'Clear breakpoints' },
      { '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', desc = 'List breakpoints' },
      { '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", desc = 'Dap continue' },
      { '<leader>dj', "<cmd>lua require'dap'.step_over()<cr>", desc = 'Dap step over' },
      { '<leader>dk', "<cmd>lua require'dap'.step_into()<cr>", desc = 'Dap step into' },
      { '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", desc = 'Dap step out' },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
          require('dapui').close()
        end,
        desc = 'Dap terminate',
      },
      { '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", desc = 'Dap REPL toggle' },
      { '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>", desc = 'Dap Run' },
      {
        '<leader>di',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Dap Hover',
      },
      {
        '<leader>d?',
        function()
          local widgets = require('dap.ui.widgets')
          widgets.centered_float(widgets.scopes)
        end,
        desc = 'Dap scopes',
      },
      { '<leader>df', '<cmd>Telescope dap frames<cr>' },
      { '<leader>dh', '<cmd>Telescope dap commands<cr>' },
      {
        '<leader>de',
        function()
          require('telescope.builtin').diagnostics({ default_text = ':E:' })
        end,
        desc = 'Dap telescope',
      },
    },
    opts = {
      controls = {
        element = 'repl',
        enabled = false,
        icons = {
          disconnect = '',
          pause = '',
          play = '',
          run_last = '',
          step_back = '',
          step_into = '',
          step_out = '',
          step_over = '',
          terminate = '',
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = 'single',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = '',
        current_frame = '',
        expanded = '',
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.50,
            },
            {
              id = 'stacks',
              size = 0.30,
            },
            {
              id = 'watches',
              size = 0.10,
            },
            {
              id = 'breakpoints',
              size = 0.10,
            },
          },
          size = 40,
          position = 'left', -- Can be "left" or "right"
        },
        {
          elements = {
            'repl',
            'console',
          },
          size = 10,
          position = 'bottom', -- Can be "bottom" or "top"
        },
      },
      mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    },
    config = function(_, opts)
      local dap = require('dap')
      require('dapui').setup(opts)

      dap.listeners.after.event_initialized['dapui_config'] = function()
        require('dapui').open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        -- Commented to prevent DAP UI from closing when unit tests finish
        -- require('dapui').close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        -- Commented to prevent DAP UI from closing when unit tests finish
        -- require('dapui').close()
      end

      -- Add dap configurations based on your language/adapter settings
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- dap.configurations.xxxxxxxxxx = {
      --   {
      --   },
      -- }
    end,
  },
  -- Configuration for the python debugger
  -- - configures debugpy for us
  -- - uses the debugpy installation from mason
  {
    'mfussenegger/nvim-dap-python',
    lazy = true,
    ft = 'python',
    config = function()
      -- uses the debugypy installation by mason
      local debugpyPythonPath = require('mason-registry').get_package('debugpy'):get_install_path()
        .. '/venv/bin/python3'
      require('dap-python').setup(debugpyPythonPath, {})
    end,
  },
}
