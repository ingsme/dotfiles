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
        markdown = { 'prettier' },
        php = { 'php-cs-fixer' },
        puppet = { 'puppet-lint' },
        python = { 'isort', 'black' },
        yaml = { 'prettier' },
        -- ruby = { 'rubocop' },
      },
    },
  },
}
