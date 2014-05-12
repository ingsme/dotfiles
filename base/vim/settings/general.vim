" ============== General Config =======================
" " Enable code folding, type za to open and close
"set foldmethod=indent
"set foldlevel=99
set foldlevelstart=0

"
" "set mouse=a " Enable mouse usage (all modes)
set number
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

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
