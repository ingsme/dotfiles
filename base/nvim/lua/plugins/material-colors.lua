return {
  "marko-cerovac/material.nvim",
  config = function()
    local material = require("material")
    material.setup({
      plugins = {
        "indent-blankline",
        "mini",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        "trouble",
        "which-key",
      },
    })
  end,
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
