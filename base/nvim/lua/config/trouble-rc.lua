local utils = require('utils')
local map = utils.map

require('trouble').setup()

map {'n', '<Leader>tt', '<Cmd>TroubleToggle<CR>'}
