--[[
local ts_stat_transforms = {
  python = function(s)
    -- "class Xyzzy(object):" → "Xyzzy"
    if s:find("class ") then
      s = s:gsub("class ", ""):gsub("%([^%)]*%):", "")
      -- "def fn(a,r,g,s) -> r:" → "fn()"
    elseif s:find("def ") then
      s = s:gsub("def ", ""):gsub("%([^%)]*%)", "()"):gsub("%).*:", ")")
    end
    return s
  end,
  lua = function(s)
    return s:gsub(" *{$", ""):gsub("%($", "")
  end
}

setmetatable(ts_stat_transforms, {
  __index = function(_, _)
    return function(s) return s end
  end
})
local ts_statusline_transformed = function()
  return require('nvim-treesitter').statusline({
    indicator_size = 100,
    type_patterns = {'class', 'function', 'method'},
    transform_fn = ts_stat_transforms[vim.o.filetype],
    separator = ' → ',
  })
end
--]]

require('lualine').setup({
  options = {icons_enabled = true, theme = 'nvim-smyck'},
  extensions = {'nvim-tree', 'quickfix'},
  sections = {
    -- lualine_a = { { 'filename', path = 1 } },
    -- lualine_b = { ts_statusline_transformed },
    lualine_c = {
      'filename',
      'lsp_progress',
    },
    -- lualine_x = {},
    -- lualine_y = {'branch'},
    -- lualine_z = {'location'}
  },
})
