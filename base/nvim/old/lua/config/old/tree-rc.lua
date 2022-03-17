-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
local utils = require 'utils'
local map = utils.map

local g = vim.g
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = "‣ "
}

require('nvim-tree').setup{
    -- open nvim-tree at startup if no file is specified
    -- open_on_setup = true
}

map{'n', '<C-n>', ':NvimTreeToggle<CR>'}       -- open/close
