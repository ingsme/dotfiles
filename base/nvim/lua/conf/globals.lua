local g = vim.g

if vim.fn.has("mac") == 1 then
  g.python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
elseif vim.fn.has("unix") == 1 then
  g.python3_host_prog = '/scratch/pyenv/versions/neovim3/bin/python'
end

local globals = {
    glow_binary_path = vim.env.HOME .. "/bin",
    glow_use_pager = true,
    glow_border = "shadow",
}

for k, v in pairs(globals) do
	vim.g[k] = v
end
