
local snippetpath = vim.fn.stdpath('config') .. '/ultisnippets'

vim.g.UltisnipsExpandTrigger = '<Plug>(ultisnips_expand)'
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
vim.g.UltiSnipsRemoveSelectModeMappings = 0
vim.g.UltiSnipsSnippetsDir = snippetpath
vim.g.UltiSnipsSnippetDirectories = {'UltiSnips', 'ultisnippets'}
