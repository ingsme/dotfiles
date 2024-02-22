return {
  -- Formatting
  {
    event = { 'BufReadPre', 'BufNewFile' },
    'stevearc/conform.nvim', -- Formatting plugin
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        css = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        makdown = { 'inject' },
        php = { 'php-cs-fixer' },
        python = { 'isort', 'black' },
        yaml = { 'prettier' },
        -- ruby = { 'rubocop' },
      },
    },
  },
}
