local lspconfig = require('lspconfig')
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local puppetls_binary = vim.fn.stdpath('data')..'/lsp_servers/puppet/puppet-languageserver'
local ok, puppet = lsp_installer_servers.get_server("puppet")
if ok then
	if not puppet:is_installed() then
		puppet:install()
	end
end

local M = {}
M.setup = function(on_attach, capabilities)
  lspconfig.puppet.setup({
    cmd = {puppetls_binary, '--stdio'},
    settings = {
      puppet = {
        editorService = {
          formatOnType = {
            enable = true,
          },
        }
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
