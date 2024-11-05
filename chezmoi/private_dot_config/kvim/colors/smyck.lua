local Highlite = require 'highlite' --- @type Highlite
local palette, terminal_palette = {
  '#1d1f21',
  '#a54242',
  '#8c9440',
  '#de935f',
  '#5f819d',
  '#85678f',
  '#5e8d87',
  '#707070',
  '#5D5D5D',
  '#E09690',
  '#CDEE69',
  '#F6DC69',
  '#96D9F1',
  '#FBB1F9',
  '#77DFD8',
  '#F7F7F7',
}
Highlite.generate('highlite', Highlite.groups('highlite', palette), terminal_palette)

local Palette = require 'highlite.color.palette' --- @type highlite.color.Palette
local colors = Palette.derive('dark', {
  bg = '#1d1f21', -- colors can be a string
  error = '#a54242',
  ok = '#00aa00',
  text = '#F6DC69',
  statement = '#77DFD8',
  storage = '#DE935F',
})
