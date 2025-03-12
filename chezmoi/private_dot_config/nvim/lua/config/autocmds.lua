-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup("my_group_" .. name, { clear = true })
end

-- create dir on write if it does not exist
autocmd("BufWritePre", {
  group = augroup("auto_mkdir"),
  callback = function(event)
    local dirname = vim.fs.dirname(event.match)
    vim.uv.fs_mkdir(dirname, tonumber("0755", 8))
  end,
})

autocmd("FileType", {
  group = augroup("puppet"),
  pattern = { "puppet" },
  callback = function()
    vim.bo.commentstring = "#%s"
  end,
})
