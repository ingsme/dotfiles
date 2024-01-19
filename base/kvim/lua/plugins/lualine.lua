return {
  {
    "nvim-lualine/lualine.nvim",
    event = 'VeryLazy',
    depependencies = {
      "arkav/lualine-lsp-progress",
    },
    opts = {
      extensions = { "mason", "quickfix" },
    },
  },
}

