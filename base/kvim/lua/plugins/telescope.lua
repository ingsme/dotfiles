return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      {
        'xiyaowong/telescope-emoji.nvim',
        config = function()
          require('telescope').load_extension('emoji')
        end,
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require('telescope').setup({
            extensions = {
              ['ui-select'] = {
                require('telescope.themes').get_dropdown({}),
              },
            },
          })
          require('telescope').load_extension('ui-select')
        end,
      },
    },
    -- stylua: ignore
    keys = {
      { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = 'Find files' },
      { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep' },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Buffers' },
      { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = 'Help tags' },
      { '<leader>fk', "<cmd>lua require('telescope.builtin').keymaps()<cr>", desc = 'Find keymap' },
      { '<leader>fe', "<cmd>Telescope emoji<cr>", desc = 'Find emojies' },
    },
    opts = {},
  },
}
