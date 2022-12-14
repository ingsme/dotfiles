local indent = 2
local options = {
 ma = true,
 mouse = "a",
 cursorline = true,
 tabstop = indent,
 shiftwidth = indent,
 softtabstop = indent,
 expandtab = true,
 autoread = true,
 nu = true,
 foldlevelstart = 99,
 scrolloff = 7,
 backup = false,
 writebackup = false,
 swapfile = false,
 clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
