-----------------------------------------------
-- Telescope plugin
-----------------------------------------------

-- https://github.com/nvim-telescope/telescope.nvim

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
      n = {
        ['q'] = actions.close,
      },
    },
  }
}
