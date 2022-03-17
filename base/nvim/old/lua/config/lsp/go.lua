local lsputils = require("config.lsp.utils")

local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, gopls = lsp_installer_servers.get_server("gopls")
if ok then
	if not gopls:is_installed() then
		gopls:install()
	end
end

require("lspconfig").gpopls.setup({
	capabilities = lsputils.get_capabilities(),
	on_attach = lsputils.on_attach,
})
