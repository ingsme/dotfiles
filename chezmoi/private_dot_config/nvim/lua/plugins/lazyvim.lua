return {
  {
    'folke/snacks.nvim',
    opts = {
      image = {
        enabled = true,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'cooklang',
        'desktop',
        'diff',
        'ini',
        'latex',
        'make',
        'powershell',
        'puppet',
        'regex',
        'sql',
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_SECTION_WHITELINES = '1',
          },
        },
      },
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
        yaml = { 'yamlfix' },
      },
    },
  },
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        ansible = { 'ansible-lint' },
        puppet = { 'puppet-lint' },
      },
    },
  },
}
