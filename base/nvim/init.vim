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
set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo
set undofile
function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction
call EnsureExists(&directory)
call EnsureExists(&backupdir)
call EnsureExists(&undodir)


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
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'mhinz/vim-sayonara'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'PotatoesMaster/i3-vim-syntax', {'for': 'i3'}
Plug 'puppetlabs/puppet-syntax-vim', {'for': 'puppet'}
Plug 'vim-python/python-syntax', {'for': ['python', 'python3']}
Plug 'hynek/vim-python-pep8-indent', {'for': ['python', 'python3']}
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'rafi/vim-tinycomment'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-rct-complete'
Plug 'davidhalter/jedi'
Plug 'BurningEther/iron.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
Plug 'junegunn/fzf'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
call plug#end()

"let g:LanguageClient_serverCommands = {
"    \ 'python': ['pyls'],
"    \ }

"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"nnoremap <silent> <Leader>lf :call LanguageClient_textDocument_documentSymbol()<CR>
"   ~always keep the signcolumn open!!
"set signcolumn=yes
"augroup LanguageClient_config
"  autocmd!
"  autocmd User LanguageClientStarted setlocal signcolumn=yes
"  autocmd User LanguageClientStopped setlocal signcolumn=yes
"augroup END

let g:python_highlight_all = 1

" Tagbar nad tags
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
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled#show_message = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1

nmap <Leader>u :MundoToggle<CR>
let g:mundo_preview_bottom = 1

" Adding comments for i3 filetype
augroup tinycomment
  autocmd FileType i3 setlocal commentstring=#%s
augroup END

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" Ale settings
nmap <Leader>k <Plug>(ale_previous_wrap)
nmap <Leader>j <Plug>(ale_next_wrap)
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nmap <leader>af <Plug>(ale_fix)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
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

" Better Whitespace
nmap <Leader>wt :ToggleWhitespace<CR>
nmap <Leader>ws :StripWhitespace<CR>
let g:strip_whitespace_on_save = 1

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

let g:NERDTreeIndicatorMapCustom = {
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

let g:fugitive_gitlab_domains = ['https://gitlab.uib.no']

" Startify settings
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = 'directory/sessions'
let g:startify_show_sessions = 1
autocmd User Startified setlocal buftype=

"let g:cm_refresh_length = 3

" Tabular settings
nmap <Leader>a== :Tabularize /=<CR>
vmap <Leader>a== :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Use TAB to select popup menus
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap ,e :edit $MYVIMRC<CR>
nnoremap ,s :source $MYVIMRC<CR>
nmap <silent> // :nohlsearch<CR>
" choose buffer with <Leader>1..9 {{{2
for i in [1,2,3,4,5,6,7,8,9]
  exec "nmap <Leader>" . i . " :buffer " . i . "<cr>"
  "	exec "nmap <Leader>" . i . " <Plug>AirlineSelectTab" . i
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
set termguicolors
set relativenumber

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

"set cursorline!
"autocmd WinLeave * setlocal nocursorline
"autocmd WinEnter * setlocal cursorline

if exists('&inccommand')
  set inccommand=split
endif

"colorscheme one
colorscheme tender
"colorscheme smyck
"colorscheme solarized
"colorscheme xoria
set background=dark

" Autocommands
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd FileType vim setlocal ts=2 sts=2 sw=2

" Python lsp
"if executable('pyls')
"  au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"endif

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
