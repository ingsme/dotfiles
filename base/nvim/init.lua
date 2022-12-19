-- Aesthetic
-- pcall catches errors if the plugin doesn't load
-- local ok, catppuccin = pcall(require, "catppuccin")
-- if not ok then return end
-- vim.g.catppuccin_flavour = 'mocha'
-- catppuccin.setup()
-- vim.cmd[[colorscheme catppuccin]]

require('conf.options')
require('conf.globals')
require('conf.plugins')
require('conf.keymap')
vim.cmd('colorscheme moonfly')
