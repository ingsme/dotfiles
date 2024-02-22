return {
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    -- stylua: ignore
    keys = {
      {
        '<leader>ng',
        function()
          require('neogen').generate({})
        end,
        desc = 'Neogen docstring',
      },
    },
    opts = { snippet_engine = 'luasnip' },
  },
}
