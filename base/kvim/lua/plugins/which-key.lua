return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		defaults = {
			mode = { "n", "v" },
			["g"] = { name = "Goto" },
			["s"] = { name = "Surround" },
			["x"] = { name = "Trouble" },
			["z"] = { name = "Folds" },
			["<leader>f"] = { name = "File" },
			["<leader>s"] = { name = "Telescope" },
			["<leader>g"] = { name = "Git" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
