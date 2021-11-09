------------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

local components = require('feline.presets')['default']
local lsp_name = {
  provider = 'lsp_client_names',
  hl = {
    fg = 'white',
    bg = 'oceanblue',
    style = 'bold',
  },
  left_sep = { ' ', 'left_rounded' },
  right_sep = {'right_rounded', ' '},
}


table.insert(components.active[1], lsp_name)
require('feline').setup ({components})
