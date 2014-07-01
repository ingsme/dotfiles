" map for syntastic errors window
nnoremap <LEADER>e :Errors<CR>

" autoclose syntastic's error windown when no errors
let g:syntastic_auto_loc_list=2

" syntastic checking mode
let g:syntastic_mode_map = { 'mode': 'active',                              
      \ 'active_filetypes': ['ruby', 'python', 'perl', 'shell', 'puppet' ],           
      \ 'passive_filetypes': ['php', 'html'] }

" check syntax on file open
let g:syntastic_check_on_open=1

