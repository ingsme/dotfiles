local g = vim.g
local o = vim.opt

g.mapleader = ' '
g.maplocalleader = ' '
g.vim_markdown_frontmatter = 0
g.python3_host_prog = '/scratch/pyenv/versions/3.12.2/envs/neovim3/bin/python3'

-- Set to true if you have a Nerd Font installed and selected in the terminal
g.have_nerd_font = true

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.smartindent = true
o.cursorline = true
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true
o.ignorecase = true
o.smartcase = true
o.conceallevel = 2

o.showmode = false

o.breakindent = true
o.undofile = true
o.signcolumn = 'yes'
