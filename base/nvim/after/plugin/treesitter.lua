local ok, treesitter = pcall(require, 'nvim-treesitter')
if not ok then
  return
end

treesitter.setup({
  context_commentstring = {
    enable = true,
    -- enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = {
    enable = true,
  },
})
