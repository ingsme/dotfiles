return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   lazy = false,
  --   opts = {
  --     flavour = 'frappe',
  --     integrations = {
  --       mason = true,
  --       neotree = true,
  --       lsp_trouble = true,
  --       which_key = true,
  --     },
  --   },
  --   config = function()
  --     vim.cmd.colorscheme('catppuccin')
  --   end,
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
  },
  {
    -- 'HoNamDuong/hybrid.nvim',
    'ingsme/nvim-smyck.nvim',
    enable = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme('hybrid')
    end,
  },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   enable = false,
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme('kanagawa-wave')
  --   end,
  -- },
}
