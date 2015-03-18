" neocomplete 
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#enable_camel_case = 1
"let g:neocomplete#enable_underbar_case = 1
"let g:neocomplete#enable_auto_delimiter = 1
"let g:neocomplete#max_list = 15
"let g:neocomplete#force_overwrite_completefunc = 1
"
" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"
" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
" let g:neocomplete#sources#omni#input_patterns = {}
"endif
"if !exists('g:neocomplete#force_omni_input_patterns')
" let g:neocomplete#force_omni_input_patterns = {}
"endif
