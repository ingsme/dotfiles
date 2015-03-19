nmap <silent> <leader>tb :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
autocmd FileType python,puppet nested :TagbarOpen
let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
      \ 'c:classes',
      \ 's:selectors',
      \ 'i:identities'
      \ ]
      \ }
let g:tagbar_type_make = {
      \ 'kinds':[
      \ 'm:macros',
      \ 't:targets'
      \ ]
      \}
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
let g:tagbar_type_puppet = {
      \ 'ctagstype': 'puppet',
      \ 'kinds': [
      \ 'c:class',
      \ 's:site',
      \ 'n:node',
      \ 'd:definition',
      \ 'r:resource',
      \ 'f:default'
      \]
      \}
let g:tagbar_type_r = {
      \ 'ctagstype' : 'r',
      \ 'kinds'     : [
      \ 'f:Functions',
      \ 'g:GlobalVariables',
      \ 'v:FunctionVariables',
      \ ]
      \ }
let g:tagbar_type_snippets = {
      \ 'ctagstype' : 'snippets',
      \ 'kinds' : [
      \ 's:snippets',
      \ ]
      \ }
let g:tagbar_type_tex = {
      \ 'ctagstype' : 'latex',
      \ 'kinds' : [
      \ 's:sections',
      \ 'g:graphics:0:0',
      \ 'l:labels',
      \ 'r:refs:1:0',
      \ 'p:pagerefs:1:0'
      \ ],
      \ 'sort' : 0,
      \ }
