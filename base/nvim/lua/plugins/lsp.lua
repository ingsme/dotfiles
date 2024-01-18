return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        bashls = {},
        cmake = {},
        diagnosticls = {},
        dockerls = {},
        eslint = {},
        gopls = {},
        ltex = {
          enabled = false,
          disabledRules = { "en", "en_US" },
        },
        puppet = {},
        pyright = {},
        -- ruby_ls = {},
        yamlls = {
          settings = {
            yaml = {
              format = {
                singleQuote = true,
              },
            },
          },
        },
        -- rust_analyzer = {},
        -- tsserver = {},
        -- html = { filetypes = { 'html', 'twig', 'hbs'} },
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
