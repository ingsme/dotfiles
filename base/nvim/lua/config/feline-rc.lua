------------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {},
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local colors = {
  bg = '#282828',
  black = '#282828',
  yellow = '#d0b03c',
  cyan = '#218693',
  oceanblue = '#72b3cc',
  green = '#8eb33b',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c8a0d1',
  white = '#b0b0b0',
  fg = '#b0b0b0',
  skyblue = '#9cd9f0',
  red = '#c75646',
}

local vi_mode_colors = {
  NORMAL = 'skyblue',
  OP = 'green',
  INSERT = 'green',
  VISUAL = 'orange',
  LINES = 'orange',
  BLOCK = 'orange',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'yellow',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}

-- Left
components.active[1][1] = {
  provider = '▊ ',
  hl = {
    fg = 'skyblue'
  }
}
-- vi-mode
components.active[1][2] = {
  provider = 'vi_mode',
  hl = function()
    return {
      name = vi_mode_utils.get_mode_highlight_name(),
      fg = vi_mode_utils.get_mode_color(),
      style = 'bold'
    }
  end,
  right_sep = ' '
}
-- filename
components.active[1][3] ={
  provider = 'file_info',
  hl = {
    fg = 'black',
    bg = 'oceanblue',
    -- style = 'bold'
  },
  left_sep = {
    ' ', 'slant_left_2',
    {str = ' ', hl = {bg = 'oceanblue', fg = 'NONE'}}
  },
  right_sep = {'slant_right_2', ' '}
}
-- git branch
components.active[1][4] = {
  provider = 'git_branch',
  hl = {
    fg = 'white',
    bg = 'bg',
    -- style = 'bold',
  },
  left_sep = ' ',
}
-- diffAdd
components.active[1][5] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold'
  }
}
-- diffModfified
components.active[1][6] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  }
}
-- diffRemove
components.active[1][7] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  }
}

-- MIddle
-- LspName
components.active[2][1] = {
  -- provider = 'lsp_client_names',
  provider = function()
    local provider = lsp.lsp_client_names()
    if provider == nil then
      provider = ''
    end
    return ' '..provider
  end,
  hl = {
    fg = 'black',
    bg = 'oceanblue',
    -- style = 'bold'
  },
  left_sep = { ' ', 'left_rounded' },
  right_sep = {'right_rounded', ' '},
}
-- diagnosticErrors
components.active[2][2] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
-- diagnosticWarn
components.active[2][3] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
-- diagnosticHint
components.active[2][4] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
-- diagnosticInfo
components.active[2][5] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}

--Right
-- fileIcon
components.active[3][1] = {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ''
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileType
components.active[3][2] = {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileSize
components.active[3][3] = {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  hl = {
    fg = 'skyblue',
    bg = 'bg',
    -- style = 'bold'
  },
  right_sep = ' '
}
-- fileFormat
components.active[3][4] = {
  provider = function()
    local format = vim.bo.fileformat
    local symbols = {
      unix = '', -- e712
      dos = '', -- e70f
      mac = '', -- e711
    }
    return symbols[format]
  end,
  hl = {
    fg = 'white',
    bg = 'bg',
    -- style = 'bold'
  },
  right_sep = ' '
}
-- fileEncode
components.active[3][5] = {
  provider = 'file_encoding',
  hl = {
    fg = 'white',
    bg = 'bg',
    -- style = 'bold'
  },
  right_sep = ' '
}
-- lineInfo
components.active[3][6] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    -- style = 'bold'
  },
  right_sep = ' '
}
-- linePercent
components.active[3][7] = {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'bg',
    -- style = 'bold'
  },
  right_sep = ' '
}
-- scrollBar
components.active[3][8] = {
  provider = 'scroll_bar',
  hl = {
    fg = 'oceanblue',
    bg = 'bg',
  },
}

require('feline').setup({
  colors = colors,
  default_bg = colors.bg,
  default_fd = colors.fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
