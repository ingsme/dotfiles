local map = vim.keymap.set

-- correct spelling mistakes in insert-mode with ctrl-l
map('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>ua', {})
map('i', 'jk', '<Esc>', {})

-- Add undo break-points
map('i', ',', ',<c-g>u', {})
map('i', '.', '.<c-g>u', {})
map('i', ';', ';<c-g>u', {})
