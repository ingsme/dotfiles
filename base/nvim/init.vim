" Install vim-plug if not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ========= XDG ==================== {{{2
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME="$HOME/.cache"
endif
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME="$HOME/.config"
endif
set directory=$XDG_CACHE_HOME/nvim
set backupdir=$XDG_CACHE_HOME/nvim/backup
set undodir=$XDG_CACHE_HOME/nvim/undo
set shada='50,<1000,s100,:0,n$XDG_CACHE_HOME/nvim/main.shada
set undofile
function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction
call EnsureExists(&directory)
call EnsureExists(&backupdir)
call EnsureExists(&undodir)

if has ("macunix")
  let g:python_host_prog = '/Users/ism089/.pyenv/versions/neovim2/bin/python'
  let g:python3_host_prog = '/Users/ism089/.pyenv/versions/neovim3/bin/python'
endif


let mapleader="\<space>"

"" UPDATE VIM ON THE FLY WITH CHANGES TO VIMRC
"if has("autocmd")
"  autocmd!
"  autocmd bufwritepost init.vim :source $MYVIMRC
"endif

call plug#begin('~/.config/nvim/plugged')
if executable("tmux")
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wellle/tmux-complete.vim'
  Plug 'tpope/vim-tbone'
endif
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 1000
Plug 'majutsushi/tagbar'
Plug 'brendonrapp/smyck-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'KeitaNakamura/neodark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'Lokaltog/vim-distinguished'
Plug 'iCyMind/NeoSolarized'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'godlygeek/tabular'
Plug 'myusuf3/numbers.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'
Plug 'mhinz/vim-sayonara'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'puppetlabs/puppet-syntax-vim', {'for': 'puppet'}
Plug 'rodjek/vim-puppet', {'for': 'puppet'}
Plug 'saltstack/salt-vim'
Plug 'vim-python/python-syntax', {'for': ['python', 'python3']}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'hynek/vim-python-pep8-indent', {'for': ['python', 'python3']}
"Plug 'python-mode/python-mode', {'for': ['python', 'python3']}
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'sheerun/vim-polyglot'
Plug 'rafi/vim-tinycomment'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'honza/vim-snippets'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

"Plug 'davidhalter/jedi'
Plug 'BurningEther/iron.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-vim'
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vim-which-key'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'do': './install --bin'}
Plug 'junegunn/fzf.vim'

Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'whiteinge/diffconflicts'
Plug 'emilyst/match-count-statusline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/fzf'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

let g:python_highlight_all = 1
if executable('/scratch/pyenv/versions/neovim2/bin/python')
  let g:python_host_prog = '/scratch/pyenv/versions/neovim2/bin/python'
endif
if executable('/scratch/pyenv/versions/neovim3/bin/python')
  let g:python3_host_prog = '/scratch/pyenv/versions/neovim3/bin/python'
endif

" Tagbar and tags
nmap <silent> <leader>tb :TagbarToggle<CR>
let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
      \}

" vim -ariline settings
let g:airline_theme='tender'
"let g:airline_theme='neodark'
"let g:airline#extensions#branch#enabled = 1
"let g:airline_powerline_fonts=1
"let g:airline#extensions#whitespace#enabled#show_message = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_min_count = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled#show_message = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#buffer_nr_format = '%s'
let g:airline#extensions#tmuxline#enabled = 1

nmap <Leader>u :MundoToggle<CR>
let g:mundo_preview_bottom = 1

" Adding comments for i3 filetype
augroup tinycomment
  autocmd FileType i3 setlocal commentstring=#%s
augroup END

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" WhichKey
nnoremap <silent><Leader> :<c-u>WhichKey '<Space>'<CR>

" Ale settings
"nmap <Leader>k <Plug>(ale_previous_wrap)
"nmap <Leader>j <Plug>(ale_next_wrap)
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nmap <leader>af <Plug>(ale_fix)
let g:ale_echo_msg_error_str = '✘'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = "on_save"
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fixers = {
      \ 'python': ['yapf'],
      \}

" EasyAlign key mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Indentline
let g:indentLine_setColors = 0
let g:indentLine_char = "┆"
let g:indentLine_setConceal = 0
let g:indentLine_enabled = 0

" Better Whitespace
nmap <Leader>wt :ToggleWhitespace<CR>
nmap <Leader>ws :StripWhitespace<CR>
let g:strip_whitespace_on_save = 1

" w!! to write a file as sudo {{{2
cmap w!! execute 'silent write !sudo tee % >/dev/null' <bar> edit!
cmap W!! execute 'silent write !sudo tee % >/dev/null' <bar> edit!

" vim-surround key bindings
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]

" NERDTree settings
nmap <Leader>f :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

" FZF key bindings
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)<Paste>
map <leader>ff :Files<CR>
map <leader>fm :Marks<CR>
map <leader>fw :Windows<CR>
map <leader>fb :Buffers<CR>
map <leader>fh :History<CR>
map <leader>fg :Tags<CR>
map <leader>ft :BTags<CR>

" vim-fugitive key bindings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:fugitive_gitlab_domains = ['https://git.app.uib.no']

" Startify settings
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = 'directory/sessions'
let g:startify_show_sessions = 1
autocmd User Startified setlocal buftype=

" Tabular settings
nmap <Leader>a== :Tabularize /=<CR>
vmap <Leader>a== :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
autocmd BufNewFile,BufRead * inoremap <silent> <buffer> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsSnippetsDir = $HOME . "/.config/nvim/UltiSnips"

" Use TAB to select popup menus
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

nnoremap ,e :edit $MYVIMRC<CR>
nnoremap ,s :source $MYVIMRC<CR>
nnoremap // :silent let @/ = ''<CR>
"nmap <silent> // :nohlsearch<CR>
" choose buffer with <Leader>1..9 {{{2
for i in [1,2,3,4,5,6,7,8,9]
"  exec "nmap <Leader>" . i . " :buffer " . i . "<cr>"
  exec "nmap <Leader>" . i . " <Plug>AirlineSelectTab" . i
endfor
nmap <Leader><Tab> :bnext<CR>
nmap <leader>0 :bfirst <CR>

nmap <Leader>bd :Sayonara!<CR>

nmap <Leader>bv :vsplit<CR>
nmap <Leader>bs :split<CR>
nmap <Leader>bc :close<CR>
nmap <Leader>bo :only<CR>

" Arrows resize windows {{{2
noremap <Up> <c-w>+
noremap <Down> <c-w>-
noremap <Right> <c-w><
noremap <Left> <c-w>>

inoremap jk <esc>

" open help in a new tab
cabbrev help tab help

set splitbelow
set splitright
set hidden

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set guicursor=
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[38;2;%lu;%lu;%lum"
  set termguicolors
endif
"set relativenumber
nnoremap <Leader>pp :NumbersToggle<CR>

set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nojoinspaces

set complete=.,w,b,u,t,i,kspell
set path+=**

" Display tabs and trailing spaces visually
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  set list listchars=tab:▸\ ,trail:␣,extends:↷,precedes:↶
else
  set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<
endif

if exists('&inccommand')
  set inccommand=split
endif

"colorscheme one
"colorscheme tender
colorscheme smyck
"colorscheme neodark
"colorscheme distinguished
"colorscheme NeoSolarized
"colorscheme solarized
"colorscheme monokai
"colorscheme xoria
set background=dark
let g:neodark#terminal_transparent = 1

" Autocommands
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd FileType vim setlocal ts=2 sts=2 sw=2

" Execution permissions by default to shebang (#!) files
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
