" ============== General Config =======================
" " Enable code folding, type za to open and close
"set foldmethod=indent
"set foldlevel=99
"set foldlevelstart=0

" Want utf8 at all times
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set ignorecase
set smartcase
set shortmess=atI

"
" "set mouse=a " Enable mouse usage (all modes)
set number
set relativenumber
set cursorline!
set backspace=2 " Makes backspace work like it should!
"
" " This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
set hidden
"
if has("syntax")
  syntax on
endif
"
" Keep 3 lines above and below cursor
set scrolloff=3

if has('patch-7.3.541')
    set formatoptions+=j " Remove comment leader when joining lines
endif

" Remove triling white space before saving
autocmd BufFilePre * :%s/\s\+$//e
