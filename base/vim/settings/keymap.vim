" ========================================
" General vim sanity improvements
" ========================================
"
"
" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
"nnoremap <Leader>yw yiww

" <Leader>ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
"nnoremap <Leader>ow "_diwhp


" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Some usefull options
inoremap jk <esc>
"inoremap <esc> <nop>
vnoremap jk <esc>
"vnoremap <esc> <nop>

"" Some toggles
nmap <silent> <unique> <Leader>tn :call ToggleRelativeAbsoluteNumber() <CR>
function! ToggleRelativeAbsoluteNumber()
    if !&number && !&relativenumber
        set number
        set norelativenumber
    elseif &number && !&relativenumber
        set nonumber
        set relativenumber
    elseif !&number && &relativenumber
        set number
        set relativenumber
    elseif &number && &relativenumber
        set nonumber
        set norelativenumber
    endif
endfunction

"Go to last edit location with <Leader>.
nnoremap <Leader>. '.

"" Use tab for indenting in normal/visual modes
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" <Leader>q to toggle quickfix window (where you have stuff like Ag)
" <Leader>oq to open it back up (rare)
nmap <silent> <Leader>qc :cclose<CR>
nmap <silent> <Leader>qo :copen<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
"nnoremap <silent> <D-j> }
"nnoremap <silent> <D-k> {
"autocmd FileType ruby map <buffer> <D-j> ]m
"autocmd FileType ruby map <buffer> <D-k> [m
"autocmd FileType rspec map <buffer> <D-j> }
"autocmd FileType rspec map <buffer> <D-k> {
"autocmd FileType javascript map <buffer> <D-k> }
"autocmd FileType javascript map <buffer> <D-j> {

" Zoom in and out of current window with <Leader>gz
map <silent> <Leader>gz <C-w>o

" Use numbers to pick the tab you want (like iTerm)
"map <silent> <D-1> :tabn 1<cr>
"map <silent> <D-2> :tabn 2<cr>
"map <silent> <D-3> :tabn 3<cr>
"map <silent> <D-4> :tabn 4<cr>
"map <silent> <D-5> :tabn 5<cr>
"map <silent> <D-6> :tabn 6<cr>
"map <silent> <D-7> :tabn 7<cr>
"map <silent> <D-8> :tabn 8<cr>
"map <silent> <D-9> :tabn 9<cr>

" choose buffer with <Leader>1..9
for i in [1,2,3,4,5,6,7,8,9]
    exec "map <Leader>" . i . " :buffer " . i . "<cr>"
endfor

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Type <Leader>hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>

" Get the current highlight group. Useful for then remapping the color
"map <Leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Source current file Cmd-% (good for vim development)
"map <D-%> :so %<CR>

" <Leader>hp = html preview
"" Use tab for indenting in normal/visual modes
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"map <silent> <Leader>hp :!open -a Safari %<CR><CR>
