" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

" Borrowed from Erik Zaadi http://www.erikzaadi.com/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('$XDG_CONFIG_HOME/bundle/vundle/README.md')
if !filereadable(vundle_readme)
echo "Installing Vundle.."
    echo ""
    silent !mkdir -p $XDG_CONFIG_HOME/bundle
    silent !git clone https://github.com/gmarik/vundle $XDG_CONFIG_HOME/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=$XDG_CONFIG_HOME/vim/bundle/vundle/
set rtp+=$XDG_CONFIG_HOME/vim/vundles/ "Submodules
call vundle#rc("$XDG_CONFIG_HOME/vim/bundle")

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" Borrowed bundle and settings idea from Yan Pritzker skwp/dotfiles
" YADR's vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" vim/vundles/ to edit them:
runtime ruby.vundle
runtime languages.vundle
runtime git.vundle
runtime appearance.vundle
runtime textobjects.vundle
runtime search.vundle
runtime project.vundle
runtime vim-improvements.vundle

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


"Filetype plugin indent on is required by vundle
filetype plugin indent on

