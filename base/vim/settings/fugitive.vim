" Use .. to go back when in fugitive bufer
autocmd User fugitive 
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

" Autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

