local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, diagnosticls = lsp_installer_servers.get_server("diagnosticls")
if ok then
	if not diagnosticls:is_installed() then
		diagnosticls:install()
	end
end

