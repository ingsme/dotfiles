return {
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'arkav/lualine-lsp-progress',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          'filename',
          'lsp_progress',
        },
      },
      extensions = { 'lazy', 'mason', 'neo-tree', 'quickfix', 'trouble' },
    },
  },
}
