return {
  'echasnovski/mini.bufremove',
  opts = {},
  -- stylua: ignore
  keys = {
    {
      '<leader>bd',
      function()
        require('mini.bufremove').delete(0, false)
      end,
      desc = 'Delete Buffer',
    },
  },
  {
    'echasnovski/mini.align',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    config = true,
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    opts = {
      draw = {
        delay = 10,
      },
      options = {
        try_as_border = true,
      },
      symbol = '╎',
    },
  },
}
