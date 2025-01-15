return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        'bashls',
        'cssls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'puppet',
        'pyright',
        'ruby_lsp',
        'ruff',
        'tailwindcss',
        'taplo',
        'texlab',
        'yamlls',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'ansible-lint',
        'black',
        'debugpy',
        'eslint_d',
        'flake8',
        'isort',
        'luacheck',
        'luaformatter',
        'markdown-toc',
        'markdownlint-cli2',
        'mypy',
        'php-cs-fixer',
        'prettier',
        'prettierd',
        'pylint',
        'pylint',
        'rubocop',
        'shellcheck',
        'shfmt',
        'stylua',
        'yamlfix',
        'yamllint',
      },
    })
  end,
}
