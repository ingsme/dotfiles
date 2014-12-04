" AutoCommands {{{
" ------------
augroup my_auto_commands
    autocmd!
    autocmd BufNewFile,BufRead *.neobundle set filetype=vim
    autocmd BufNewFile,BufRead *.vundle set filetype=vim
    autocmd FileType gitcommit setlocal spell
    autocmd Filetype vim setlocal foldmethod=marker
    autocmd FileType ruby,yaml,erb,sass set ai sw=2 sts=2 et
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END
" }}}
