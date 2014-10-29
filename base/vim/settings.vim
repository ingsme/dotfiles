"for fpath in split(globpath('$XDG_CONFIG_HOME/vim/settings', '*.vim'), '\n')
"  exe 'source' fpath
"endfor
runtime! settings/*.vim
