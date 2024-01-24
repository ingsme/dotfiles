local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('my_group_' .. name, { clear = true })
end

autocmd('FileType', {
  group = augroup('spell'),
  pattern = { 'markdown', 'text', 'gitcommit', 'latex' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- only highlight when searching
vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = augroup('shl'),
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = true
    end
  end,
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  group = augroup('shl'),
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = false
    end
  end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- create dir on write if it does not exist
autocmd('BufWritePre', {
  group = augroup('auto_mkdir'),
  callback = function(event)
    local dirname = vim.fs.dirname(event.match)
    vim.uv.fs_mkdir(dirname, tonumber('0755', 8))
  end,
})
