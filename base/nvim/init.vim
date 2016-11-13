" Install vim-plug if not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let mapleader="\<space>"

call plug#begin('~/.config/nvim/plugged')
Plug 'adonis0147/prettyGuides'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'freeo/vim-kalisi'
Plug 'godlygeek/tabular'
Plug 'lilydjwg/colorizer'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'rafi/vim-tinycomment'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:delimitMate_expand_cr=2

let g:airline_theme='luna'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled#show_message = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Adding comments for i3 filetype
augroup tinycomment
  autocmd FileType i3 setlocal commentstring=#%s
augroup END

autocmd! BufWritePost,BufEnter * Neomake

nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]

nmap <Leader>f :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"colorscheme solarized
"colorscheme gruvbox
"colorscheme kalisi
"colorscheme OceanicNext
colorscheme smyck
set background=dark

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ruler
set termguicolors
set laststatus=2
set number
set relativenumber
set hidden
set ignorecase
set smartcase
set cursorline!
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

if exists('&inccommand')
    set inccommand=nosplit
endif

" Arrows resize windows {{{2
noremap <Up> <c-w>+
noremap <Down> <c-w>-
noremap <Right> <c-w><
noremap <Left> <c-w>>

"Clear current search highlight by double tapping // {{{2
nmap <silent> // :nohlsearch<CR>

" Type <Leader>hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" Some usefull options {{{2
inoremap jk <esc>
vnoremap jk <esc>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" choose buffer with <Leader>1..9 {{{2
for i in [1,2,3,4,5,6,7,8,9]
  exec "nmap <Leader>" . i . " :buffer " . i . "<cr>"
endfor
nmap <Leader><Tab> :bnext

" w!! to write a file as sudo {{{2
cmap w!! w !sudo tee % >/dev/null
cmap W!! w !sudo tee % >/dev/null

" Move between Vim and Tmux windows {{{2
"if exists('$TMUX')
"  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"    let previous_winnr = winnr()
"    execute "wincmd " . a:wincmd
"    if previous_winnr == winnr()
"      " The sleep and & gives time to get back to vim so tmux's focus tracking
"      " can kick in and send us our ^[[O
"      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
"      redraw!
"    endif
"  endfunction
"  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
"  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
"  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
"  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
"  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
"else
"  map <C-h> <C-w>h
"  map <C-j> <C-w>j
"  map <C-k> <C-w>k
"  map <C-l> <C-w>l
"endif


if has('nvim')
  nnoremap <leader>t  :split +terminal<cr>
  tnoremap <esc>      <c-\><c-n>
  tnoremap <a-h>      <c-\><c-n><c-w>h
  tnoremap <a-j>      <c-\><c-n><c-w>j
  tnoremap <a-k>      <c-\><c-n><c-w>k
  tnoremap <a-l>      <c-\><c-n><c-w>l
  autocmd BufEnter term://* startinsert
endif

map <Leader>pp :call  TogglePaste()<CR>
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

" Augroup {{{2
augroup MyAuGroup
  autocmd BufNewFile,BufRead *.neobundle set filetype=vim
  autocmd BufNewFile,BufRead *.vundle set filetype=vim
  autocmd BufNewFile,BufRead *.tex set filetype=latex
  autocmd BufNewFile,BufRead *.pp set filetype=puppet
  autocmd FileType gitcommit setlocal spell
  autocmd FileType vim setlocal fdm=marker ts=2 sts=2 sw=2 fdl=99
  autocmd FileType ruby,yaml,erb,sass set ai sw=2 sts=2 ts=2 et fdl=99
  autocmd FileType python set colorcolumn=79
  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  autocmd FileType c,cpp,java,php,vim,i3,python,ruby,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" Make 0 go to the first character rather than the beginning
" Execution permissions by default to shebang (#!) files {{{2
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
