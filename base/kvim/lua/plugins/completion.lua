return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"honza/vim-snippets",
		},
	},
	{
		"honza/vim-snippets",
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},
}
