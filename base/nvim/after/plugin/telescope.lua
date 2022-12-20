-- Telescope Setup
local ok, telescope = pcall(require, 'telescope')
local _, actions = pcall(require, 'telescope.actions')
if not ok then
  return
end
-- local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

telescope.setup{
  defaults = {
  --     prompt_prefix = "$ ",
      mappings = {
          i = {
  --           ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end,
  --           ['<c-h>'] = 'which-key',
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ['<esc>'] = actions.close,
          },
      },
  },
}
