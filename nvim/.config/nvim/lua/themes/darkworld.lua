local M = {}

M.base_30 = {
  white = "#e8dff5",
  darker_black = "#080614",
  black = "#0d0a1a",      -- bg
  black2 = "#151025",
  one_bg = "#1a1230",
  one_bg2 = "#241a40",
  one_bg3 = "#2d1f4e",
  grey = "#6b5a8e",
  grey_fg = "#4d3a6c",
  grey_fg2 = "#5d4a7c",
  light_grey = "#7a6b96",
  red = "#c93040",
  baby_pink = "#e85565",
  pink = "#d946a8",
  line = "#1e1535",
  green = "#4caf60",
  vibrant_green = "#6dd48a",
  nord_blue = "#5b6de8",
  blue = "#7b8dff",
  yellow = "#e0b040",
  sun = "#f0d060",
  purple = "#ae3c80",
  dark_purple = "#4a2d7a",
  teal = "#5bacbd",
  orange = "#e87040",
  cyan = "#80d4e8",
  statusline_bg = "#100c20",
  lightbg = "#1e1535",
  pmenu_bg = "#ae3c80",
  folder_bg = "#7b8dff",
}

M.base_16 = {
  base00 = "#0d0a1a",     -- Default bg
  base01 = "#151025",     -- Lighter bg
  base02 = "#241a40",     -- Selection bg
  base03 = "#6b5a8e",     -- Comments 
  base04 = "#7a6b96",     -- Dark fg
  base05 = "#d4c8e8",     -- Default fg
  base06 = "#e0d6f0",     -- Light fg
  base07 = "#e8dff5",     -- Lightest fg
  base08 = "#e85565",     -- Variables, errors
  base09 = "#e87040",     -- Integers, constants
  base0A = "#e0b040",     -- Classes, search
  base0B = "#4caf60",     -- Strings
  base0C = "#5bacbd",     -- Regex, escape chars
  base0D = "#7b8dff",     -- Functions
  base0E = "#d946a8",     -- Keywords
  base0F = "#c93040",     -- Deprecated
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@parameter"] = { fg = M.base_30.cyan },
    ["@keyword"] = { fg = M.base_30.pink },
    ["@keyword.return"] = { fg = M.base_30.pink },
    ["@type"] = { fg = M.base_30.yellow },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.call"] = { fg = M.base_30.blue },
    ["@string"] = { fg = M.base_30.green },
    ["@number"] = { fg = M.base_30.orange },
    ["@operator"] = { fg = M.base_30.cyan },
  },
}

return M
