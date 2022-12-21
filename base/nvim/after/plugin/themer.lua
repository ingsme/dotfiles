local ok, themer = pcall(require, 'themer')
if not ok then
  return
end

themer.setup({
  colorscheme = 'sonokai_deep',
  -- colorscheme = 'papa_dark',
  -- colorscheme = 'ayu_dark',
})
