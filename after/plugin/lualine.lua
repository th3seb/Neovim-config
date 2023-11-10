
local colors = {
  black       = '#202328',
  white    = '#bbc2cf',
  yellow   = '#ffd867',
  cyan     = '#26c8be',
  darkblue = '#081633',
  green    = '#a4d674',
  orange   = '#fc9868',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}



local theme = {
  normal = {
    a = {gui="bold", fg = colors.black, bg = colors.yellow },
    b = { gui="bold",fg = colors.black, bg = colors.red },
    c = { gui="bold",fg = colors.black, bg = colors.white },
    z = { gui="bold",fg = colors.black, bg = colors.yellow },
  },
  insert = { a = { gui = "bold", fg = colors.black, bg = colors.violet} },
  visual = { a = { gui = "bold",fg = colors.black, bg = colors.green } },
  replace = { a = { gui = "bold",fg = colors.black, bg = colors.cyan } },
}


require("lualine").setup({  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '\\', right = '/' },
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename',  "filesize" },
    lualine_x = {{"datetime", style = "%H:%M"} ,'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename', "filesize"},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
