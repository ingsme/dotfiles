local lspconfig = require('lspconfig')
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local ok, null_ls = lsp_installer_servers.get_server("null-ls")
if ok then
	if not null_ls:is_installed() then
		null_ls:install()
	end
end

local M ={}
M.setup = function(on_attach, capabilities)
  local sources = {
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.flake8,
    -- null_ls.builtins.formatting.isort,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua.with({
      extra_args = { '--quote-style', 'AutoPreferSingle'},
    }),
  }
  null_ls.config { sources = sources }

  lspconfig.null_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
return M

