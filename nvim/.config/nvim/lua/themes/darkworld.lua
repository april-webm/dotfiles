-- Catppuccin Mocha theme for NvChad
-- This file is kept for reference; the active theme is set via chadrc.lua (theme = "catppuccin")

local M = {}

M.base_30 = {
  white = "#cdd6f4",
  darker_black = "#11111b",
  black = "#1e1e2e",      -- bg (Base)
  black2 = "#181825",
  one_bg = "#313244",
  one_bg2 = "#45475a",
  one_bg3 = "#585b70",
  grey = "#6c7086",
  grey_fg = "#585b70",
  grey_fg2 = "#45475a",
  light_grey = "#7f849c",
  red = "#f38ba8",
  baby_pink = "#f38ba8",
  pink = "#f5c2e7",
  line = "#313244",
  green = "#a6e3a1",
  vibrant_green = "#a6e3a1",
  nord_blue = "#89b4fa",
  blue = "#89b4fa",
  yellow = "#f9e2af",
  sun = "#f9e2af",
  purple = "#cba6f7",
  dark_purple = "#cba6f7",
  teal = "#94e2d5",
  orange = "#fab387",
  cyan = "#89dceb",
  statusline_bg = "#181825",
  lightbg = "#313244",
  pmenu_bg = "#cba6f7",
  folder_bg = "#89b4fa",
}

M.base_16 = {
  base00 = "#1e1e2e",     -- Default bg
  base01 = "#181825",     -- Lighter bg
  base02 = "#313244",     -- Selection bg
  base03 = "#6c7086",     -- Comments
  base04 = "#7f849c",     -- Dark fg
  base05 = "#cdd6f4",     -- Default fg
  base06 = "#bac2de",     -- Light fg
  base07 = "#a6adc8",     -- Lightest fg
  base08 = "#f38ba8",     -- Variables, errors
  base09 = "#fab387",     -- Integers, constants
  base0A = "#f9e2af",     -- Classes, search
  base0B = "#a6e3a1",     -- Strings
  base0C = "#94e2d5",     -- Regex, escape chars
  base0D = "#89b4fa",     -- Functions
  base0E = "#cba6f7",     -- Keywords
  base0F = "#f38ba8",     -- Deprecated
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
