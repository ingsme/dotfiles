return {
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    depependencies = {
      'arkav/lualine-lsp-progress',
    },
    opts = {
      extensions = { 'mason', 'quickfix' },
    },
  },
}
