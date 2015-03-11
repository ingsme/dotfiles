" ============== General Config =======================
" " Enable code folding, type za to open and close
"set foldmethod=indent
"set foldlevel=99
set foldlevelstart=0

"
" "set mouse=a " Enable mouse usage (all modes)
set number
set relativenumber
set cursorline!
set backspace=2 " Makes backspace work like it should!
" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

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

if has('patch-7.3.541')
    set formatoptions+=j " Remove comment leader when joining lines
endif

" Remove triling white space before saving
autocmd BufFilePre * :%s/\s\+$//e
" Make it beautiful - colors and fonts

" http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized
"colorscheme hybrid
set background=dark

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end
else
  "dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:.

" Hightligh searches
set hlsearch
" Use h,j,k,l to move around in vim! Don't cheat!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ================ Completion =======================

" set wildmode=list:longest
" set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
" set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
" set wildignore+=*vim/backups*
" set wildignore+=*sass-cache*
" set wildignore+=*DS_Store*
" set wildignore+=vendor/rails/**
" set wildignore+=vendor/cache/**
" set wildignore+=*.gem
" set wildignore+=log/**
" set wildignore+=tmp/**
" set wildignore+=*.png,*.jpg,*.gif

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

" Move between Vim and Tmux windows {{{

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" }}}

" Some usefull options
inoremap jk <esc>
"inoremap <esc> <nop>
vnoremap jk <esc>
"vnoremap <esc> <nop>

"" Some toggles
nmap <silent> <unique> <Leader>tn :call ToggleRelativeAbsoluteNumber()<CR>
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

map <Leader>p :call  TogglePaste()<CR>
function!  TogglePaste()
    if  !&paste
        set invpaste
        :PrettyGuidesDisable
        set nonumber
        set norelativenumber
    elseif  &paste
        set invpaste
        :PrettyGuidesEnable
        set number
        set relativenumber
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
" Abbreviations
iabbrev @@ ingar.smedstad@adm.uib.no
iabbrev ccopy Copyright 2014 Ingar Smedstad.

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END
