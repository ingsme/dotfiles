return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        'cssls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'pyright',
        'tailwindcss',
        'bashls',
        'marksman',
        'puppet',
        'ruff',
        'taplo',
        'texlab',
        'yamlls',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'black',
        'eslint_d',
        'isort',
        'prettier',
        'pylint',
        'debugpy',
        'flake8',
        'luacheck',
        'markdown-toc',
        'markdownlint-cli2',
        'mypy',
        'php-cs-fixer',
        'prettierd',
        'pylint',
        'stylua',
        'yamllint',
      },
    })
  end,
}
