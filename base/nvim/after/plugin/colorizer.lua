local ok, color = pcall(require, 'colorizer')
if not ok then
  return
end

color.setup({})
