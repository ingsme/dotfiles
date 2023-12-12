return {
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		},
		opts = {
			options = {
				separator_style = "slant",
				indicator = {
					style = "icon",
				},
				offsets = {
					{
						filetype = "CHADTree",
						text = "CHADTree",
						text_align = "center",
						separator = true,
					},
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			options = {
				theme = "tokyonight",
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			exclude = {
				filetypes = {
					"help",
					"alpa",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"notify",
					"toogleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
}
