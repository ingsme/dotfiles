local map = vim.keymap.set

-- correct spelling mistakes in insert-mode with ctrl-l
map('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>ua', {})
map('i', 'jk', '<Esc>', {})

-- Add undo break-points
map('i', ',', ',<c-g>u', {})
map('i', '.', '.<c-g>u', {})
map('i', ';', ';<c-g>u', {})

-- buffers
vim.api.nvim_set_keymap('n', 'tl', ':blast<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'th', ':bfirst<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'tj', ':bprev<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'tk', ':bnext<enter>', { noremap = false })
vim.api.nvim_set_keymap('n', 'td', ':bdelete<enter>', { noremap = false })
-- files
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = false })
vim.api.nvim_set_keymap('n', 'B', '^', { noremap = false })
vim.api.nvim_set_keymap('n', 'TT', ':TransparentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ss', ':noh<CR>', { noremap = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Obsidian workflow
--
-- Navigate to vault
map('n', '<leader>oo', ':cd $HOME/Documents/obsidian/Vault42')
-- Convert note to note template
map('n', '<leader>on', ':ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>')
-- Strip date from title
map('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>')
-- search for files in full vault
map('n', '<leader>os', ':Telescope find_files search_dirs={"$HOME/Documents/obsidian/Vault42"}<cr>')
map('n', '<leader>oz', ':Telescope live_grep search_dirs={"$HOME/Documents/obsidian/Vault42"}<cr>')
--
-- notes review
-- move file in current buffer to zettelkasten folder
map('n', '<leader>ok', ":!mv '%:p' $HOME/Documents/obsidian/Vault42/zettelkasten<cr>:bd<cr>")
-- delete file in current buffer
map('n', '<leader>odd', ":!rm '%:p'<cr>:bd<cr>")
