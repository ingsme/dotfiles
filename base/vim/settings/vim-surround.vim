" <Leader># Surround a word with #{ruby interpolation}
map <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>

" <Leader>" Surround a word with "quotes"
map <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

" <Leader>' Surround a word with 'single quotes'
map <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

" <Leader>) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <Leader>( ysiw(
map <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

" <Leader>[ Surround a word with [brackets]
map <Leader>] ysiw]
map <Leader>[ ysiw[
vmap <Leader>[ c[ <C-R>" ]<ESC>
vmap <Leader>] c[<C-R>"]<ESC>

" <Leader>{ Surround a word with {braces}
map <Leader>} ysiw}
map <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

map <Leader>` ysiw`
