local map = vim.keymap.set

-- Delete some keymaps
-- vim.keymap.del('n', 's')
-- map({ 'n', 'x' }, 's', '<Nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- correct spelling mistakes in insert-mode with ctrl-l
map('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>ua', {})
map('i', 'jk', '<Esc>', {})

-- Add undo break-points
map('i', ',', ',<c-g>u', {})
map('i', '.', '.<c-g>u', {})
map('i', ';', ';<c-g>u', {})

-- files
map('n', 'E', '$', { noremap = false })
map('n', 'B', '^', { noremap = false })
-- map('n', 'TT', ':TransparentToggle<CR>', { noremap = true })

-- buffers
map('n', 'tl', ':blast<enter>', { noremap = false })
map('n', 'th', ':bfirst<enter>', { noremap = false })
map('n', 'tj', ':bprev<enter>', { noremap = false })
map('n', 'tk', ':bnext<enter>', { noremap = false })
map('n', 'td', ':bdelete<enter>', { noremap = false })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
