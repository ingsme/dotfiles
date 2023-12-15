-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.vimtex_compiler_clean_paths = { "_minted*" }

local opt = vim.opt
opt.spelllang = { "en", "nb" }
opt.wrap = true
