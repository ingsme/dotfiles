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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle "scrooloose/syntastic"
NeoBundle "xolox/vim-misc"
NeoBundle "xolox/vim-easytags"
NeoBundle "majutsushi/tagbar"
NeoBundle "kien/ctrlp.vim"
NeoBundle "vim-scripts/a.vim"
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
"NeoBundle "Raimondi/delimitMate", { 'insert': 1 }
NeoBundle  "SirVer/ultisnips"
NeoBundle  "honza/vim-snippets"
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
NeoBundle 'tpope/vim-characterize'
NeoBundle "vits/ZoomWin"
NeoBundle "briandoll/change-inside-surroundings.vim"
NeoBundle "jiangmiao/auto-pairs"
NeoBundle "justinmk/vim-sneak"
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
NeoBundle  "davidhalter/jedi-vim", {
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
