vim.g.mapleader = ' '
vim.g.localleader = ' '

local opt = vim.opt

opt.spelllang = { 'nb' , 'en' }
opt.spell = false

opt.number = true
opt.relativenumber = true
opt.scrolloff = 4

opt.splitbelow = true
opt.splitright = true

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.clipboard = 'unnamedplus'

opt.virtualedit = 'block'
opt.inccommand = 'split'
opt.ignorecase = true

opt.termguicolors = true

opt.foldlevel = 999

vim.o.conceallevel = 1
