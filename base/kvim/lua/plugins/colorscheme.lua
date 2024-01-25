return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
  },
  {
    'HoNamDuong/hybrid.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("hybrid")
    end
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    --config = function()
      --vim.cmd.colorscheme('kanagawa-wave')
    --end,
  },
}
