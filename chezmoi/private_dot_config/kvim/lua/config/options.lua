vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.vim_markdown_frontmatter = 0
vim.g.python3_host_prog = '/scratch/pyenv/versions/3.12.2/envs/neovim3/bin/python3'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.grepformat = '%f:%l:%c:%m'
-- if vim.fn.executable('rg') then
--   vim.opt.grepprg = 'rg --vimgrep --no-heading' .. (opt.smartcase and ' --smart-case' or '') .. ' --'
-- elseif vim.fn.executable('ag') then
--   vim.opt.grepprg = 'ag --vimgrep' .. (opt.smartcase and ' --smart-case' or '') .. ' --'
-- end

vim.opt.conceallevel = 2
