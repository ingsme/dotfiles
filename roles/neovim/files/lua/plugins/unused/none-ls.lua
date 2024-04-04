-- stylua: ignore
if true then return {} end
return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.shfmt,
          -- null_ls.builtins.formatting.puppet_lint,
          -- null_ls.builtins.diagnostics.puppet_lint,
          -- null_ls.builtins.diagnostics.bashls,
          null_ls.builtins.diagnostics.yamllint,
        },
      })
    end,
  },
}
