local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('my_group_' .. name, { clear = true })
end

-- spell check in text filetypes
autocmd('FileType', {
  group = augroup('spell'),
  pattern = { 'markdown', 'text', 'gitcommit', 'latex' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- only highlight when searching
autocmd('CmdlineEnter', {
  group = augroup('shl'),
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = true
    end
  end,
})
autocmd('CmdlineLeave', {
  group = augroup('shl'),
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = false
    end
  end,
})

-- Highlight when yanking
autocmd('TextYankPost', {
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

autocmd('FileType', {
  group = augroup('python'),
  pattern = { 'python' },
  callback = function()
    -- use pep8 standards
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    -- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
    -- if you are a heavy user of folds, consider using `nvim-ufo`
    vim.opt_local.foldmethod = 'indent'
    -- automatically capitalize boolean values. Useful if you come from a
    -- different language, and lowercase them out of habit.
    vim.cmd.inoreabbrev('<buffer> true True')
    vim.cmd.inoreabbrev('<buffer> false False')
    -- in the same way, we can fix habits regarding comments or None
    vim.cmd.inoreabbrev('<buffer> -- #')
    vim.cmd.inoreabbrev('<buffer> null None')
    vim.cmd.inoreabbrev('<buffer> none None')
    vim.cmd.inoreabbrev('<buffer> nil None')
  end,
})

autocmd('FileType', {
  group = augroup('puppet'),
  pattern = { 'puppet' },
  callback = function()
    vim.bo.commentstring = '#%s'
  end,
})
