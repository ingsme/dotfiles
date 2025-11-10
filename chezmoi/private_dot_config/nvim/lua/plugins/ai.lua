return {
  -- {
  --   'ggml-org/llama.vim',
  -- },
  --
  -- set the following line in your config/options.lua
  -- vim.g.lazyvim_blink_main = true

  {
    'milanglacier/minuet-ai.nvim',
    event = 'VeryLazy',
    config = function()
      require('minuet').setup({
        -- Your configuration options here
      })
    end,
  },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      keymap = {
        ['<A-y>'] = {
          function(cmp)
            cmp.show({ providers = { 'minuet' } })
          end,
        },
      },
      sources = {
        -- if you want to use auto-complete
        default = { 'minuet' },
        providers = {
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            score_offset = 100,
          },
        },
      },
    },
  },
}
