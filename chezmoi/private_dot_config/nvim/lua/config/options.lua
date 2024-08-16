vim.g.mapleader = ' '
vim.g.localleader = ' '
vim.g.vim_markdown_frontmatter = 0
vim.g.python3_host_prog = '/scratch/pyenv/versions/3.12.2/envs/neovim3/bin/python3'

local opt = vim.opt

opt.background = 'dark'

opt.spelllang = { 'nb', 'en' }
opt.spell = false

opt.number = true
opt.relativenumber = true
opt.scrolloff = 4

opt.splitbelow = true
opt.splitright = true

opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.clipboard = 'unnamedplus'

opt.virtualedit = 'block'
opt.inccommand = 'split'
opt.ignorecase = true

opt.termguicolors = true
opt.cursorline = true

opt.foldlevel = 999

opt.title = true
opt.titlestring = '%<%F%=%l/%L - nvim'

-- Searching
opt.ignorecase = true -- Search ignoring case
opt.smartcase = true -- Keep case when searching with *
-- opt.inccommand = 'nosplit' -- Preview incremental substitute
opt.grepformat = '%f:%l:%c:%m'
if vim.fn.executable('rg') then
  opt.grepprg = 'rg --vimgrep --no-heading' .. (opt.smartcase and ' --smart-case' or '') .. ' --'
elseif vim.fn.executable('ag') then
  opt.grepprg = 'ag --vimgrep' .. (opt.smartcase and ' --smart-case' or '') .. ' --'
end

opt.conceallevel = 2
