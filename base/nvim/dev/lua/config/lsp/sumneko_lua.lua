local lspconfig = require('lspconfig')
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, sumneko_lua = lsp_installer_servers.get_server("sumneko_lua")
if ok then
	if not sumneko_lua:is_installed() then
		sumneko_lua:install()
	end
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/extension/server'
local sumneko_binary = sumneko_root_path..'/bin/'..system_name..'/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local M = {}
M.setup = function(on_attach, capabilities)
  lspconfig.sumneko_lua.setup({
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          enable = true,
          globals = {
            'global',
            "vim",
            'use',
            'describe',
            'it',
          },
        },
      },
      telemetry = {
        enable = false,
      },
    },
  })
end

return M
