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
set rtp+=$XDG_CONFIG_HOME/vim/neobundles
call neobundle#begin(expand("$XDG_CONFIG_HOME/vim/bundle"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

runtime general.neobundle
runtime appaerance.neobundle
runtime programming.neobundle

if GotTheNeo == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
