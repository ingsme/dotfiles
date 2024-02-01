return {
  {
    'danymat/neogen',
		-- stylua: ignore
		keys = {
			{ '<leader>ng', function() require('neogen').generate({}) end, desc = 'Neogen Comment' },
		},
    opts = { snippet_engine = 'luasnip' },
  },
}
