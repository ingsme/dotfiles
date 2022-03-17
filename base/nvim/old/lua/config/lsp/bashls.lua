local lspconfig = require('lspconfig')
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, bashls = lsp_installer_servers.get_server("bashls")
if ok then
	if not bashls:is_installed() then
		bashls:install()
	end
end

local M ={}
M.setup = function(on_attach, capabilities)
  lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
return M
