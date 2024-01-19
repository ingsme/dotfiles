return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  keys = {
    {'<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = 'Find files'},
    {'<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = 'Grep'},
    {'<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = 'Buffers'},
    {'<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = 'Help tags'},
  },
}
