" Initialisation {{{1
set nocompatible
set nomore

augroup MyAuGroup
  autocmd!
augroup END

" ========= XDG ==================== {{{2
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME=expand("$HOME/.cache")
endif
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME=expand("$HOME/.config")
endif
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
set directory=$XDG_CACHE_HOME/vim
set backupdir=$XDG_CACHE_HOME/vim/backup
set undodir=$XDG_CACHE_HOME/vim/undo
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after

function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction
call EnsureExists(&directory)
call EnsureExists(&backupdir)
call EnsureExists(&undodir)

" The mapleader has to be set before we load plugins
let mapleader="\<space>"

" Plugin configuration  {{{1
" Initialization  {{{2
filetype off

" Install vim-plug if not present.
let GotPlugged=1
if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  let GotPlugged=0
endif

call plug#begin('~/.config/vim/plugged')
" Look and Feel  {{{2
Plug 'brendonrapp/smyck-vim'
Plug 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

Plug 'vimperator/vimperator.vim'

Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark="hard"

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'w0ng/vim-hybrid'
Plug 'zeis/vim-kolor'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
"let g:airline_theme='raven'
let g:airline_theme='luna'
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
" choose buffer with <Leader>1..9 {{{2
for i in [1,2,3,4,5,6,7,8,9]
"  exec "nmap <Leader>" . i . " :buffer " . i . "<cr>"
  exec "nmap <Leader>" . i . " <Plug>AirlineSelectTab" . i
endfor
nmap <Leader><Tab> <Plug>AirlineSelectNextTab
nmap <leader>0 :bfirst <CR>


Plug 'adonis0147/prettyGuides'
" IDE settings  {{{2
Plug 'scrooloose/nerdtree'
nmap <silent> <leader>f :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'
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

Plug 'scrooloose/syntastic'
" map for syntastic errors window
nnoremap <LEADER>e :SyntasticCheck<CR>:Errors<CR>
" syntastic checking mode
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'python', 'perl', 'shell', 'puppet' ],
      \ 'passive_filetypes': ['php', 'html'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'
let g:syntastic_allways_populate_loc_list = 1
" check syntax on file open
let g:syntastic_check_on_open=1
" autoclose syntastic's error windown when no errors
let g:syntastic_auto_loc_list=2
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-documentation-check'
let g:syntastic_aggregate_errors = 1

Plug 'emilyst/match-count-statusline'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
nmap <silent> <leader>tb :TagbarToggle<CR>
"autocmd FileType python,puppet nested :TagbarOpen
let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
      \ 'c:classes',
      \ 's:selectors',
      \ 'i:identities'
      \ ]
      \ }
let g:tagbar_type_make = {
      \ 'kinds':[
      \ 'm:macros',
      \ 't:targets'
      \ ]
      \}
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \ 'c:class',
      \ 's:site',
      \ 'n:node',
      \ 'd:definition',
      \ 'r:resource',
      \ 'f:default'
      \]
      \}
let g:tagbar_type_r = {
      \ 'ctagstype' : 'r',
      \ 'kinds'     : [
      \ 'f:Functions',
      \ 'g:GlobalVariables',
      \ 'v:FunctionVariables',
      \ ]
      \ }
let g:tagbar_type_snippets = {
      \ 'ctagstype' : 'snippets',
      \ 'kinds' : [
      \ 's:snippets',
      \ ]
      \ }
let g:tagbar_type_tex = {
      \ 'ctagstype' : 'latex',
      \ 'kinds' : [
      \ 's:sections',
      \ 'g:graphics:0:0',
      \ 'l:labels',
      \ 'r:refs:1:0',
      \ 'p:pagerefs:1:0'
      \ ],
      \ 'sort' : 0,
      \ } "}}}3

" GIT  {{{2
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 1000

Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

Plug 'vim-scripts/gitignore'

" Completion {{{2
Plug 'Shougo/neocomplete.vim'
nnoremap <Leader>x :NeoCompleteToggle<CR> "{{{
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
"let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_underbar_case = 1
let g:neocomplete#enable_auto_delimiter = 1
"let g:neocomplete#force_overwrite_completefunc = 1
"
"" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
""let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"inoremap <expr><Space> neocomplete#close_popup() . "\<Space>"
"inoremap <expr><BS> pumvisible() ? neocomplete#smart_close_popup() . "\<BS>" : delimitMate#BS()
"inoremap <silent><CR> <C-R>=<SID>my_rc_function()<CR>
"function! s:my_rc_function()
"  " Fore inserting <CR> ket.
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType txt NeoCompleteLock
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif "}}}


" Text editing features  "{{{2
Plug 'Konfekt/FastFold'
Plug  'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<leader>s"
"let g:UltiSnipsListSnippets="<C-ø>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:snips_author="Ingar Smedstad"
let g:snips_email="ingar.smedstad@uib.no"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir=$XDG_CONFIG_HOME.'/vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
if has("python3")
  let g:UltiSnipsUsePythonVersion = 3
endif

" inoremap <TAB> {{{1
" Next menu item, expand snippet, jump to next placeholder or insert literal tab
let g:UltiSnipsJumpForwardTrigger="<NOP>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrJumpForwardOrReturnTab()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<TAB>"
    endif
endfunction
inoremap <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ "<C-R>=ExpandSnippetOrJumpForwardOrReturnTab()<CR>"
" jump to next placeholder otherwise do nothing
snoremap <buffer> <silent> <TAB>
    \ <ESC>:call UltiSnips#JumpForwards()<CR>
" previous menu item, jump to previous placeholder or do nothing
let g:UltiSnipsJumpBackwordTrigger = "<NOP>"
inoremap <expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "<C-R>=UltiSnips#JumpBackwards()<CR>"
" jump to previous placeholder otherwise do nothing
snoremap <buffer> <silent> <S-TAB>
    \ <ESC>:call UltiSnips#JumpBackwards()<CR>
" expand snippet, close menu or insert newline
let g:UltiSnipsExpandTrigger = "<NOP>"
let g:ulti_expand_or_jump_res = 0
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrReturnEmptyString()<CR>
function! s:ExpandSnippetOrReturnEmptyString()
    if pumvisible()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-y>\<CR>"
    endif
    else
        return "\<CR>"
endfunction

Plug  'honza/vim-snippets'
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle'}
nmap <Leader>u :MundoToggle<CR>
let g:mundo_preview_bottom=1
if has("python3")
  let g:mundo_prefer_python3=1
endif

Plug 'tpope/vim-characterize'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'tpope/vim-surround'
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'reedes/vim-lexical'
let g:lexical#spellfile = ['~/.config/vim/spell/en.utf-8.add',]

"Plug 'reedes/vim-litecorrect'
"Plug 'reedes/vim-textobj-quote'
"Plug 'reedes/vim-textobj-sentence'
"Plug 'kana/vim-textobj-user'
"Plug 'reedes/vim-pencil'
"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"\ | call lexical#init()
"\ | call litecorrect#init()
"\ | call textobj#quote#init()
"\ | call textobj#sentence#init()
"  autocmd FileType text call pencil#init()
"augroup END

"Plug 'reedes/vim-colors-pencil'
"Plug 'reedes/vim-thematic'
"let g:thematic#themes = {
"\ 'solarized' : {'colorscheme': 'solarized',
"\                'background': 'dark',
"\                'airline-theme': 'luna',
"\               },
"\ 'smyck' : {'colorscheme': 'smyck',
"\            'background': 'dark',
"\            'airline-theme': 'luna',
"\           },
"\ 'pencil_dark' : {'colorscheme': 'pencil',
"\                  'background': 'dark',
"\                  'airline-theme': 'pencil',
"\                 },
"\ 'pencil_light': {'colorscheme': 'pencil',
"\                  'background': 'light',
"\                  'airline-theme': 'pencil',
"\                 },
"\}

"Plug 'tpope/vim-markdown'
"let g:markdown_fenced_languages = ['python', 'ruby']
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plug 'tpope/vim-repeat'
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
nmap <Leader>a== :Tabularize /=<CR>
vmap <Leader>a== :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

Plug 'junegunn/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' }
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = [233, 234]
augroup rainbow_parentheses
  autocmd!
  autocmd FileType java,puppet,ruby,python,vim,lisp,clojure,scheme RainbowParentheses
augroup END


Plug 'gorkunov/smartpairs.vim'
let g:smartpairs_start_from_word = 1

Plug 'rafi/vim-tinycomment'
nmap <Leader>v :TinyCommentLines<CR>
vmap <Leader>v :TinyCommentLines<CR>
vmap <Leader>V :TinyCommentBlock<CR>
" Adding comments for i3 filetype
augroup tinycomment
  autocmd FileType i3 setlocal commentstring=#%s
augroup END

" Syntax  {{{2
Plug 'klen/python-mode', { 'for': 'python'}
" Neocomplete handles autocompletion
let g:pymode_rope_completion = 0
let g:pymode_lint_on_fly = 1
nmap <leader>la :PymodeLintAuto<CR>

Plug 'davidhalter/jedi-vim', { 'for': 'python', 'do': 'git submodule update --init' }
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'lilydjwg/colorizer'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'voxpupuli/vim-puppet', { 'for': 'puppet' }

" Misc  {{{2
Plug 'mhinz/vim-startify'
let g:startify_change_to_vcs_root = 1
let g:startify_session_dir = 'directory/sessions'
let g:startify_show_sessions = 1
autocmd User Startified setlocal buftype=

Plug 'jez/vim-superman'
Plug 'ingsme/create_start_fold_marker.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'edkolev/tmuxline.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

if GotPlugged == 0
  echo "Installing plugins"
  echo ""
  :PlugInstall
endif
call plug#end()

filetype plugin indent on

autocmd VimEnter *
  \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|    PlugInstall --sync | q
  \|  endif

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
":PlugCheck

" General settings  {{{1
set number
set relativenumber
set cursorline!
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

" Indentation {{{2
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nojoinspaces

" Reading/Writing {{{2
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set autoread                " (Don't) automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set encoding=utf-8
set backspace=2             " Makes backspace work like it should!
set scrolloff=3             " Keep 3 lines above and below cursor
set hidden
set spelllang=en,nb,nn
nnoremap <F7> :setlocal spell!<CR>
imap <c-f> <c-g>u<Esc>[s1z=``]a<c-g>u
nmap <c-f> [s1z=<c-o>

" Searching {{{2
set incsearch
set showmatch
set hlsearch
set smartcase
set ignorecase

" Folds {{{2
"set foldminlines=50
"set foldcolumn=4
set nofoldenable    " disable folding
set fillchars=

" History {{{2
set history=1000
set undofile
set undoreload=1000
set noswapfile

if has("syntax")
  syntax on
endif

"if has('clipboard')
"  if has('unnamedplus')
"    set clipboard=unnamed,unnamedplus
"  else
"    set clipboard=unnamed
"  endif
"endif

if has('patch-6.3.541')
  set formatoptions+=j " Remove comment leader when joining lines
endif

" Colors and fonts {{{2
"colorscheme solarized
"colorscheme hybrid
"colorscheme gruvbox
colorscheme smyck
set background=dark

" Display tabs and trailing spaces visually
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  set list listchars=tab:▸\ ,trail:␣,extends:↷,precedes:↶
else
  set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<
endif

" Arrows resize windows {{{2
noremap <Up> <c-w>+
noremap <Down> <c-w>-
noremap <Right> <c-w><
noremap <Left> <c-w>>
" change cursor position in insert mode
"inoremap <C-h> <left>
"inoremap <C-l> <right>
" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" ================ Completion ======================= {{{2
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Augroup {{{2
augroup MyAuGroup
  autocmd BufNewFile,BufRead *.neobundle set filetype=vim
  autocmd BufNewFile,BufRead *.vundle set filetype=vim
  autocmd BufNewFile,BufRead *.tex set filetype=latex
  autocmd BufNewFile,BufRead *.pp set filetype=puppet
  autocmd FileType gitcommit setlocal spell
  autocmd FileType vim setlocal fdm=marker ts=2 sts=2 sw=2 fdl=99
  autocmd FileType ruby,yaml,erb,sass set ai sw=2 sts=2 ts=2 et fdl=99
  autocmd FileType python set colorcolumn=79
  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  autocmd FileType c,cpp,java,php,vim,i3,python,ruby,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Move between Vim and Tmux windows {{{2
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" copy
 vmap <C-c> :w! ~/.vimbuf<CR>
 nmap <C-c> :.w! ~/.vimbuf<CR>

 " paste
 map <C-p> :r ~/.vimbuf<CR>

" Some usefull options {{{2
inoremap jk <esc>
vnoremap jk <esc>

"" Some toggles {{{2
nmap <silent> <unique> <Leader>tn :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
    set number
    set norelativenumber
  elseif &number && !&relativenumber
    set nonumber
    set relativenumber
  elseif !&number && &relativenumber
    set number
    set relativenumber
  elseif &number && &relativenumber
    set nonumber
    set norelativenumber
  endif
endfunction

map <Leader>pp :call  TogglePaste()<CR>
function!  TogglePaste()
  if  !&paste
    set invpaste
    :PrettyGuidesDisable
    set nonumber
    set norelativenumber
  elseif  &paste
    set invpaste
    :PrettyGuidesEnable
    set number
    set relativenumber
  endif
endfunction

function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l,c)
endfunction

"Go to last edit location with <Leader>.
nnoremap <Leader>. '.

" text bubbling {{{2
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Option toggles borrowed from tpope  {{{2
"function! s:toggle(op)
"  return eval('&'.a:op) ? 'no'.a:op : a:op
"endfunction
"
"function! s:option_map(letter, option)
"  exe 'nnoremap [o'.a:letter.' :set '.a:option.'<CR>'
"  exe 'nnoremap ]o'.a:letter.' :set no'.a:option.'<CR>'
"  exe 'nnoremap co'.a:letter.' :set <C-R>=<SID>toggle("'.a:option'")<CR><CR>'
"endfunction
"
"call s:option_map('l', 'list')
"call s:option_map('n', 'number')
"call s:option_map('r', 'relativenumber')
"call s:option_map('s', 'spell')
"call s:option_map('w', 'wrap')
"call s:option_map('p', 'paste')

" Use tab for indenting in normal/visual modes {{{2
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nmap <silent> <Leader>qc :cclose<CR>
nmap <silent> <Leader>qo :copen<CR>

" Create window splits easier. The default {{{2
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent><leader>vv <C-w>v
nnoremap <silent><leader>ss <C-w>s
nnoremap <silent><leader>sc <C-w>c

"Clear current search highlight by double tapping // {{{2
"nmap <silent> // :nohlsearch<CR>
noremap // :silent let @/ = ''<CR>

" Type <Leader>hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>

" Abbreviations
iabbrev @@ ingar.smedstad@uib.no
iabbrev ccopy Copyright 2015 Ingar Smedstad.

" w!! to write a file as sudo {{{2
cmap w!! w !sudo tee % >/dev/null<CR>
cmap W!! w !sudo tee % >/dev/null<CR>

" Execution permissions by default to shebang (#!) files {{{2
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
