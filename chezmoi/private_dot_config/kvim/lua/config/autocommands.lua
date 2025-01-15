local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('my_group_' .. name, { clear = true })
end

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('FileType', {
  group = augroup('puppet'),
  pattern = { 'puppet' },
  callback = function()
    vim.bo.commentstring = '#%s'
  end,
})
