-- Gruvbox Dark theme for NvChad
-- This file is kept for reference; the active theme is set via chadrc.lua (theme = "gruvbox")

local M = {}

M.base_30 = {
  white = "#ebdbb2",
  darker_black = "#1d2021",
  black = "#282828",      -- bg
  black2 = "#32302f",
  one_bg = "#3c3836",
  one_bg2 = "#504945",
  one_bg3 = "#665c54",
  grey = "#928374",
  grey_fg = "#7c6f64",
  grey_fg2 = "#857665",
  light_grey = "#a89984",
  red = "#cc241d",
  baby_pink = "#fb4934",
  pink = "#d3869b",
  line = "#3c3836",
  green = "#98971a",
  vibrant_green = "#b8bb26",
  nord_blue = "#458588",
  blue = "#83a598",
  yellow = "#d79921",
  sun = "#fabd2f",
  purple = "#b16286",
  dark_purple = "#8f3f71",
  teal = "#689d6a",
  orange = "#d65d0e",
  cyan = "#8ec07c",
  statusline_bg = "#1d2021",
  lightbg = "#3c3836",
  pmenu_bg = "#d79921",
  folder_bg = "#458588",
}

M.base_16 = {
  base00 = "#282828",     -- Default bg
  base01 = "#3c3836",     -- Lighter bg
  base02 = "#504945",     -- Selection bg
  base03 = "#665c54",     -- Comments
  base04 = "#bdae93",     -- Dark fg
  base05 = "#ebdbb2",     -- Default fg
  base06 = "#d5c4a1",     -- Light fg
  base07 = "#fbf1c7",     -- Lightest fg
  base08 = "#fb4934",     -- Variables, errors
  base09 = "#d65d0e",     -- Integers, constants
  base0A = "#d79921",     -- Classes, search
  base0B = "#98971a",     -- Strings
  base0C = "#689d6a",     -- Regex, escape chars
  base0D = "#458588",     -- Functions
  base0E = "#b16286",     -- Keywords
  base0F = "#cc241d",     -- Deprecated
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    ["@punctuation.bracket"] = { fg = M.base_30.purple },
    ["@parameter"] = { fg = M.base_30.cyan },
    ["@keyword"] = { fg = M.base_30.purple },
    ["@keyword.return"] = { fg = M.base_30.purple },
    ["@type"] = { fg = M.base_30.yellow },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.call"] = { fg = M.base_30.blue },
    ["@string"] = { fg = M.base_30.green },
    ["@number"] = { fg = M.base_30.orange },
    ["@operator"] = { fg = M.base_30.teal },
  },
}

return M
