filetype off

let GotTheNeo=1
let neobundle_readme=expand('$XDG_CONFIG_HOME/vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo ""
  silent !mkdir -p $XDG_CONFIG_HOME/vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim $XDG_CONFIG_HOME/vim/bundle/neobundle.vim
  let GotTheNeo=0
endif

set rtp+=$XDG_CONFIG_HOME/vim/bundle/neobundle.vim
"set rtp+=$XDG_CONFIG_HOME/vim/neobundles
call neobundle#begin(expand("$XDG_CONFIG_HOME/vim/bundle"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ----- Making Vim look good ------------------------------------------
NeoBundle "altercation/vim-colors-solarized"
NeoBundle 'morhetz/gruvbox'
NeoBundle "w0ng/vim-hybrid"
NeoBundle "zeis/vim-kolor"
NeoBundle "tomasr/molokai"
NeoBundle "bling/vim-airline"
NeoBundle "adonis0147/prettyGuides"
" ----- Vim as a programmer's text editor -----------------------------
NeoBundle 't9md/vim-choosewin'
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
nmap <silent> <leader>f <Plug>NERDTreeMirrorToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.git','\.hg','\.vagrant']

NeoBundle "scrooloose/syntastic"
NeoBundle "xolox/vim-misc"
"NeoBundle "xolox/vim-easytags"
NeoBundle "ingsme/create_start_fold_marker.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle 'Shougo/unite.vim', {
      \ 'depends': 'Shougo/tabpagebuffer.vim',
      \ 'commands': [
      \   { 'name': 'Unite', 'complete': 'customlist,unite#complete_source' }
      \ ]}
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif
function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  "  imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()
nmap f [unite]
nnoremap [unite] <nop>
nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -start-insert -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':'file_mru'}}
NeoBundleLazy 'osyo-manga/unite-airline_themes', {'autoload':{'unite_sources':'airline_themes'}} "{{{
nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>
"}}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':'colorscheme'}} "{{{
nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>
"}}}
NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file', 'tag/include']}} "{{{
nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
"}}}
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}} "{{{
nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
"}}}
NeoBundleLazy 'Shougo/unite-help', {'autoload':{'unite_sources':'help'}} "{{{
nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
"}}}
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen','unite_sources':['junkfile','junkfile/new']}} "{{{
nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>
"}}}
NeoBundle  "Shougo/neocomplete", {
      \ 'depends': 'Shougo/context_filetype.vim',
      \ 'disabled': ! has('lua'),
      \ 'insert': 1
      \ }
" ----- Working with Git ----------------------------------------------
NeoBundle "airblade/vim-gitgutter"
NeoBundle "tpope/vim-fugitive"
NeoBundle "gitignore"
" ----- Other text editing features -----------------------------------
NeoBundle "Raimondi/delimitMate", { 'insert': 1 }
NeoBundle  "SirVer/ultisnips"
NeoBundle  "honza/vim-snippets"
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
NeoBundle 'tpope/vim-characterize'
NeoBundle "vits/ZoomWin"
NeoBundle "briandoll/change-inside-surroundings.vim"
NeoBundle "justinmk/vim-sneak"
NeoBundle 'godlygeek/tabular'
NeoBundle 'gorkunov/smartpairs.vim', {
      \ 'autoload': {
      \  'commands': [ 'SmartPairs', 'SmartPairsI', 'SmartPairsA' ],
      \  'mappings': [[ 'n', 'viv' ], [ 'v', 'v' ]]}}
NeoBundle "rafi/vim-tinycomment.git", {
      \ 'directory': 'tinycomment',
      \ 'augroup': 'tinycomment',
      \ 'commands': [ 'TinyCommentLines', 'TinyCommentBlock' ],
      \ 'mappings': [
      \ [ 'n', '<leader>v' ], [ 'v', '<leader>v' ],
      \ [ 'v', '<leader>V' ]
      \ ]}
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle "AlxHnr/clear_fold_text"
NeoBundle "ingsme/create_start_fold_marker.vim"
" ----- Utilities -----------------------------------------------------
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
" ----- man pages, tmux -----------------------------------------------
NeoBundle "jez/vim-superman"
NeoBundle "christoomey/vim-tmux-navigator"
NeoBundle "edkolev/tmuxline.vim"
" ----- Syntax plugins ------------------------------------------------
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
NeoBundleLazy  "davidhalter/jedi-vim", {
      \ 'autoload': {'filetype': ['python']},
      \ 'build': {
      \     'unix': 'git submodule update --init',
      \     'mac': 'git submodule update --init',
      \   },
      \ }
NeoBundle "jez/vim-c0"
NeoBundle "jez/vim-ispc"
NeoBundle "PotatoesMaster/i3-vim-syntax"
NeoBundle "lilydjwg/colorizer"
NeoBundle 'kchmck/vim-coffee-script',{'autoload' : {
      \ 'commands' : [
      \ 'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
      \ 'CoffeeRun', 'CoffeeWatch'],
      \ 'filetypes' : ['coffee']
      \ }}
NeoBundle "vim-ruby/vim-ruby"
NeoBundle "rodjek/vim-puppet"
" ----- Misc ------------------------------------------------------------
NeoBundle 'mhinz/vim-startify'

if GotTheNeo == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :NeoBundleInstall
endif

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""" Unused """
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'kana/vim-textobj-indent'
"NeoBundle 'kana/vim-textobj-entire'
"NeoBundle 'lucapette/vim-textobj-underscore'
"NeoBundle 'yuratomo/w3m.vim'
