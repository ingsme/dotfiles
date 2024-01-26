-- TODO: Skriv om denne
return {
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'honza/vim-snippets',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'micangl/cmp-vimtex',
        'onsails/lspkind.nvim',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      cmp.setup({
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'emoji' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          -- ['<C-f>'] = luasnip.jump(1),
          -- ['<C-b>'] = luasnip.jump(-1),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'path' },
          { name = 'cmdline' },
        },
      })
      cmp.setup.filetype('tex', {
        sources = {
          { name = 'vimtex' },
        },
      })
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'honza/vim-snippets',
      config = function()
        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load({ paths = { '~/.config/nvim/LuaSnip/' } })
      end,
    },
    opts = {
      enable_autosnippets = true,
    },
    keys = function()
      return {
        { '<leader>se', '<Cmd>lua require("luasnip.loaders").edit_snippet_files()<CR>', desc = 'Edit snippet files' },
        { '<leader>sl', '<Cmd>lua require("luasnip.extras.snippet_list").open()<CR>',   desc = 'Open snippet list' },
      }
    end,
  },
  {
    'honza/vim-snippets',
    lazy = true,
    config = function()
      require('luasnip.loaders.from_snipmate').lazy_load()
    end,
  },
}
