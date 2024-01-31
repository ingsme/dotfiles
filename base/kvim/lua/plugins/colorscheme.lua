return {
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
  --[[ {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme('kanagawa-wave')
    end,
  }, ]]
}
