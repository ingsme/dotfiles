return {
  {
    'wookayin/semshi', -- use a maintained fork
    ft = 'python',
    build = ':UpdateRemotePlugins',
    init = function()
      -- Disabled these features better provided by LSP or other more general plugins
      vim.g['semshi#error_sign'] = false
      vim.g['semshi#simplify_markup'] = false
      vim.g['semshi#mark_selected_nodes'] = false
      vim.g['semshi#update_delay_factor'] = 0.001

      -- This autocmd must be defined in init to take effect
      vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
        group = vim.api.nvim_create_augroup('SemanticHighlight', {}),
        callback = function()
          -- Only add style, inherit or link to the LSP's colors
          vim.cmd([[
          highlight! semshiGlobal gui=italic
          highlight! link semshiImported @lsp.type.namespace
          highlight! link semshiParameter @lsp.type.parameter
          highlight! link semshiParameterUnused DiagnosticUnnecessary
          highlight! link semshiBuiltin @function.builtin
          highlight! link semshiAttribute @field
          highlight! link semshiSelf @lsp.type.selfKeyword
          highlight! link semshiUnresolved @lsp.type.unresolvedReference
          highlight! link semshiFree @comment
          ]])
        end,
      })
    end,
  },
  -- better indentation behavior
  -- by default, vim has some weird indentation behavior in some edge cases,
  -- which this plugin fixes
  { 'Vimjas/vim-python-pep8-indent', ft = 'python' },

  -- select virtual environments
  -- - makes pyright and debugpy aware of the selected virtual environment
  -- - Select a virtual environment with `:VenvSelect`
  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    ft = 'python',
    opts = {
      dap_enabled = true, -- makes the debugger work with venv
    },
  },
}
