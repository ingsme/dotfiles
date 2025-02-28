return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cooklang",
        "desktop",
        "diff",
        "ini",
        "latex",
        "make",
        "powershell",
        "puppet",
        "regex",
        "sql",
      },
    },
  },
}
