return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ['https://raw.githubusercontent.com/canonical/cloud-init/main/cloudinit/config/schemas/versions.schema.cloud-config.json'] = 'user-data',
            },
          },
        },
      },
    },
  },
}
