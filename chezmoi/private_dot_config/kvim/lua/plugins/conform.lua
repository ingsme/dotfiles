return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require('conform')

      conform.setup({
        formatters_by_ft = {
          bash = { 'shfmt' },
          css = { 'prettierd' },
          html = { 'prettierd' },
          javascript = { 'prettierd' },
          javascriptreact = { 'prettierd' },
          json = { 'prettierd' },
          lua = { 'stylua' },
          markdown = { 'prettierd', 'markdownlint-cli2', 'markdown-toc' },
          puppet = { 'puppet-lint' },
          python = { 'isort', 'black' },
          -- ruby = { 'rubocop' },
          typescript = { 'prettierd' },
          typescriptreact = { 'prettierd' },
          yaml = { 'prettierd', 'yamlfix' },
        },
        formatters = {
          yamlfix = {
            env = {
              YAMLFIX_WHITELINES = '1',
              YAMLFIX_SECTION_WHITELINES = '1',
              YAMLFIX_SEQUENCE_STYLE = 'keep_style',
              YAMLFIX_quote_representation = "'",
              YAMLFIX_quote_basic_values = true,
            },
          },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ 'n', 'v' }, '<leader>F', function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = 'Format file or range (in visual mode)' })
    end,
  },
}
