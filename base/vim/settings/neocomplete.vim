" vim: fdm=marker ts=2 sts=2 sw=2
" neocomplete 
"  let g:acp_enableAtStartup = 0
"  let g:neocomplete#enable_at_startup = 1
"  let g:neocomplete#enable_smart_case = 1
"  let g:neocomplete#enable_camel_case = 1
"  let g:neocomplete#enable_fuzzy_completion = 1
"  let g:neocomplete#enable_underbar_case = 1
"  let g:neocomplete#enable_auto_delimiter = 1
"  let g:neocomplete#max_list = 15
"  let g:neocomplete#enable_auto_close_preview = 1
"  let g:neocomplete#force_overwrite_completefunc = 1
"
"  " Define keyword.patterns
"  if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"  endif
"  let g:neocomplete#keyword_patterns._ = '\h\w*'
"  let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'
"
"  " <TAB>: completion.
"  inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"  "      \ <SID>check_back_space() ? "\<TAB>" : 
"  "      \neocomplete#start_manual_complete()
"  "function! s:check_back_space() "{{{
"  "  let col = col('.') - 1
"  "  return !col || getline('.')[col - 1] =~ '\s'
"  "endfunction "}}}
"  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
"
"  " <CR>: close popup and save indent
"  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"  function! s:my_cr_function() "{{{
"    return neocomplete#close_popup() . "\<CR>"
"  endfunction "}}}
"
"  " Enable omni completion.
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=jedi#completions
"  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
"  " Enable heavy omni completion.
"  if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"  endif
"  if !exists('g:neocomplete#force_omni_input_patterns')
"    let g:neocomplete#force_omni_input_patterns = {}
"  endif
"  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"  let g:neocomplete#force_omni_input_patterns.python =
"        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"  " alternative pattern: '\h\w*\|[^. \t]\.\w*'
"
"  let g:neocomplete#sources#dictionary#dictionaries = {
"        \ 'java' : '$XDG_CONFIG_HOME/vim/dict/java.dict',
"        \ 'ruby' : '$XDG_CONFIG_HOME/vim/dict/ruby.dict',
"        \ 'scala' : '$XDG_CONFIG_HOME/vim/dict/scala.dict',
"        \ 'sh' : '$XDG_CONFIG_HOME/vim/dict/bash.dict',
"        \ }
