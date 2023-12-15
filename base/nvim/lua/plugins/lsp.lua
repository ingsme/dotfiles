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
        yamlls = {},
        -- rust_analyzer = {},
        -- tsserver = {},
        -- html = { filetypes = { 'html', 'twig', 'hbs'} },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      },
    },
  },
}
