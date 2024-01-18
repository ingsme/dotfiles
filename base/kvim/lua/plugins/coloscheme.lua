return {
  { 
    'ellisonleao/gruvbox.nvim',
    lazy = true,
  },
  { 
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd.colorscheme('kanagawa-wave')
    end,
  },
}
