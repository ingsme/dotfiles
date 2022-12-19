local ok, cmnt = pcall(require, 'comment')
if not ok then
  return
end
cmnt.setup()
