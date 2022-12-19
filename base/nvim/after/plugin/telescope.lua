-- Telescope Setup
local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end
-- local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

telescope.setup{
  defaults = {
      prompt_prefix = "$ ",
      mappings = {
          i = {
            ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
          }
      }
  }
}
