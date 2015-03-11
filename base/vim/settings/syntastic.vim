" map for syntastic errors window
nnoremap <LEADER>e :SyntasticCheck<CR>:Errors<CR>

" syntastic checking mode
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'python', 'perl', 'shell', 'puppet' ],
      \ 'passive_filetypes': ['php', 'html'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" check syntax on file open
let g:syntastic_check_on_open=1
" autoclose syntastic's error windown when no errors
let g:syntastic_auto_loc_list=2
