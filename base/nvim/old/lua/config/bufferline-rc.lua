local utils = require("utils")
local map = utils.map

require("bufferline").setup({
	options = {
		numbers = "none",
		diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
		-- separator_style = "slant",
		allways_show_bufferline = true,
	},
})

for k = 1, 9 do
	map({ "n", "<Leader>" .. k, "<Cmd>BufferLineGoToBuffer " .. k .. "<CR>" })
end
map({ "n", "<Leader>0", "<Cmd>BufferLinePick<CR>" })
