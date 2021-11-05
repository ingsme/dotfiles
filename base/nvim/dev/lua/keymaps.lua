-- Keymaps
local utils = require 'utils'
local map = utils.map

--map {'n', '//', 'let @/ = ""', silent = true}
map {'n', '//', '<Cmd>nohlsearch<CR>'}
map {'n', '<Leader><Tab>', ':bnext<CR>'}

map {'n', '<Up>', '<c-w>+'}
map {'n', '<Down>', '<c-w>-'}
map {'n', '<Left>', '<c-w><'}
map {'n', '<Right>', '<c-w>>'}

map {'i', 'jk', '<Esc>'}

-- Break undo chain on punctuation so we can
-- use 'u' to undo sections of an edit
for _, c in ipairs({',', '.', '!', '?', ';'}) do
   --map('i', c, c .. "<C-g>u")
   vim.api.nvim_set_keymap('i', c, c..'<C-g>u', {noremap = true})
end

function _G.toggle_numbers()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end

map {'n', '<Leader>pp', '<Cmd>lua toggle_numbers()<CR>'}

-- Temporary map for showing highlight
map {'n', '<Leader>hh', '<Cmd>TSHighlightCapturesUnderCursor<CR>'}

-- Fugitive
map {'n', '<Leader>gb', '<Cmd>Git blame<CR>'}

--[[
-- smart tab
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
--]]

