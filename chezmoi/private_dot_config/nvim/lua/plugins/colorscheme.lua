return {
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
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme('hybrid')
    end,
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
