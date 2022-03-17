--local lsputils = require("config.lsp.utils")

local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, pyright = lsp_installer_servers.get_server("pyright")
if ok then
	if not pyright:is_installed() then
		pyright:install()
	end
end

--require("lspconfig").pyright.setup({
--	capabilities = lsputils.get_capabilities(),
--	on_attach = lsputils.lsp_attach,
--})
