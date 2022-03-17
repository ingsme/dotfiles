vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

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
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end