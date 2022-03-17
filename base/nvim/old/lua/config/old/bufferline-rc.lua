local utils = require('utils')
local map = utils.map

require('bufferline').setup {
    options = {
        numbers = 'both',
        diagnostics = 'nvim_lsp',
        separator_style = 'thin',
        allways_show_bufferline = true,
    }
}

--for k = 1,10,1 do
--    map {'n', '<Leader>'..k, '<Cmd>BufferLineGoToBuffer '..k..'<CR>'}
--end
map {'n', '<Leader>0', '<Cmd>BufferLinePick<CR>'}
