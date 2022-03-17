local lspconfig = require('lspconfig')
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local yaml_binary = vim.fn.stdpath('data')..'/lsp_servers/yaml/node_modules/yaml-language-server/bin/yaml-language-server'
local ok, yamlls = lsp_installer_servers.get_server("yamlls")
if ok then
	if not yamlls:is_installed() then
		yamlls:install()
	end
end

local M = {}
M.setup = function(on_attach, capabilities)
  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { yaml_binary, '--stdio' },
    settings = {
      yaml = {
        format = {
          enable = true,
          singleQuote = true,
        }
      },
    },
  })
end

return M
