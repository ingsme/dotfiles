return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
      { '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = 'Find files' },
      { '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = 'Grep' },
      { '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>",    desc = 'Buffers' },
      { '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>",  desc = 'Help tags' },
      { '<leader>fk', "<cmd>lua require('telescope.builtin').keymaps()<cr>",    desc = 'Find keymap' },
      { '<leader>:',  '<cmd>Telescope command_history<cr>',                     desc = 'Command History' },
      { '<leader>fe', '<cmd>Telescope emoji<cr>',                               desc = 'Find emojies' },
    },
    opts = {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
      },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
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
}
