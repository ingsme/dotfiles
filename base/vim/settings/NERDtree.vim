" Make nerdtree look nice
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 30
let NERDTreeMouseMode = 2

nmap <silent> <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>\ :NERDTreeFind<CR>:vertical res 30<CR>

