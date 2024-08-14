return {
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    keys = {
      -- stylua: ignore
      { '<leader>ng', function() require('neogen').generate({}) end, desc = 'Neogen docstring', },
    },
    opts = { snippet_engine = 'luasnip' },
  },
}
