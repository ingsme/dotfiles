return {
  {
    'nvim-mini/mini.splitjoin',
    version = '*',
    event = 'VeryLazy',
    opts = {
      mappings = {
        toggle = 'gS',
        split = 'gs',
        join = 'gj',
      },
    },
  },
}
