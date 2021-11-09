-----------------------------------------------
-- Telescope plugin
-----------------------------------------------

-- https://github.com/nvim-telescope/telescope.nvim

local utils = require("utils")
local map = utils.map

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
        ['<c-j>'] = actions.move_selection_next,
        ['<c-k>'] = actions.move_selection_previous,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
})

require("telescope").load_extension("emoji")
require("telescope").load_extension("fzf")
require('telescope').load_extension('notify')

map({ "n", "<Leader>ff", "<Cmd>Telescope find_files<CR>" })
map({ "n", "<Leader>fb", "<Cmd>Telescope buffers<CR>" })
map({ "n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>" })
map({ "n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>" })
map({ "n", "<Leader>fe", "<Cmd>Telescope emoji<CR>" })
map({ "n", "<Leader>fn", "<Cmd>Telescope notify<CR>" })
--map({ "n", "<Leader>fq", "<Cmd>Telescope quickfix<CR>" })
