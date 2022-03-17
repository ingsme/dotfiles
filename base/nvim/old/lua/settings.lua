-----------------------------------------------------------
-- Neo vim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
-- local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local tabstops = 2

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " " -- change leader to a comma
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile

-----------------------------------------------------------
-- Providers
g.loaded_python_provider = 0
g.loaded_perl_provider = 0
if vim.fn.has("mac") == 1 then
  g.python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
elseif vim.fn.has("unix") == 1 then
  g.python3_host_prog = '/scratch/pyenv/versions/neovim3/bin/python'
end

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.cursorline = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldnestmax = 3
opt.foldlevel =3
opt.foldlevelstart = 3
--opt.foldmethod = "marker" -- enable folding (default 'foldmarker')
--opt.colorcolumn = '80'        -- line lenght marker at 80 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
	false
)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 1000 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
-- opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors
--cmd('colorscheme monokai')
--cmd('colorscheme smyck')

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = tabstops -- shift tabstops spaces when tab
opt.tabstop = tabstops -- 1 tab == tabstops spaces
opt.smartindent = true -- autoindent new lines

-- Cursorline
cmd([[autocmd WinLeave * setlocal nocursorline]])
cmd([[autocmd WinEnter * setlocal cursorline]])

-- Filetypes
cmd([[au BufNewFile,BufRead *.pp set filetype=puppet]])

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
cmd([[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,puppet setlocal shiftwidth=2 tabstop=2
]])

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = "|" -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd([[autocmd FileType markdown let g:indentLine_enabled=0]])

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = "menuone,noselect,noinsert" -- completion options
--opt.shortmess = 'c' 	-- don't show completion messages

-----------------------------------------------------------
-- Execute permissions by default on shebang (#!) files
-----------------------------------------------------------
exec(
	[[
augroup shebang_chmod
autocmd!
autocmd BufNewFile  * let b:brand_new_file = 1
autocmd BufWritePost * unlet! b:brand_new_file
autocmd BufWritePre *
\ if exists('b:brand_new_file') |
\   if getline(1) =~ '^#!' |
\     let b:chmod_post = '+x' |
\   endif |
\ endif
autocmd BufWritePost,FileWritePost *
\ if exists('b:chmod_post') && executable('chmod') |
\   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
\   unlet b:chmod_post |
\ endif
augroup END
]],
	false
)
