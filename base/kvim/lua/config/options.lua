vim.g.mapleader = ' '

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

opt.clipboard = 'unnamedplus'

opt.virtualedit = 'block'
opt.inccommand = 'split'
opt.ignorecase = true
opt.termguicolors = true

vim.o.conceallevel = 1
