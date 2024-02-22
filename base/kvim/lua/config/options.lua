-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.vimtex_compiler_clean_paths = { "_minted*" }

vim.opt_local.spell = true

local opt = vim.opt
opt.spelllang = { "nb", "en" }
opt.spell = true
opt.wrap = true
