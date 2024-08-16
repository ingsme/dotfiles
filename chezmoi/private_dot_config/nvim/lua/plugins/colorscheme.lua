return {
  {
    'pappasam/papercolor-theme-slim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('PaperColorSlim')
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = true,
    opts = {
      flavour = 'mocha',
      integrations = {
        cmp = true,
        mason = true,
        neotree = true,
        lsp_trouble = true,
        which_key = true,
      },
    },
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
  },
  {
    -- 'HoNamDuong/hybrid.nvim',
    'ingsme/nvim-smyck.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
    -- config = function()
    --   vim.cmd.colorscheme('hybrid')
    -- end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    -- priority = 1000,
    -- opts = {},
    -- config = function()
    --   vim.cmd.colorscheme('kanagawa-wave')
    -- end,
  },
}
