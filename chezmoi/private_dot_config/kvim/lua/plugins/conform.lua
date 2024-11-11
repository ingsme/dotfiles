return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require('conform')

      conform.setup({
        formatters_by_ft = {
          javascript = { 'prettierd' },
          typescript = { 'prettierd' },
          javascriptreact = { 'prettierd' },
          typescriptreact = { 'prettierd' },
          css = { 'prettierd' },
          html = { 'prettierd' },
          json = { 'prettierd' },
          bash = { 'shfmt' },
          yaml = { 'prettierd', 'yamlfix' },
          markdown = { 'prettierd', 'markdownlint-cli2', 'markdown-toc' },
          lua = { 'stylua', 'luaformatter' },
          python = { 'isort', 'black' },
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
