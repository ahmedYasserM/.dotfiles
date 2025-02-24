-- credits to original theme https://rosepinetheme.com/
-- this is a modified version of it

local M = {}

M.base_30 = {
  black = "#11111B", --  nvim bg
  darker_black = "#11111B",
  white = "#d1cef0",
  black2 = "#11111B",
  one_bg = "#11111B", -- real bg of onedark
  one_bg2 = "#2d2b38",
  one_bg3 = "#353340",
  grey = "#3f3d4a",
  grey_fg = "#474552",
  grey_fg2 = "#514f5c",
  light_grey = "#5d5b68",
  red = "#eb6f92",
  baby_pink = "#f5799c",
  pink = "#ff83a6",
  line = "#2e2c39", -- for lines like vertsplit
  green = "#ABE9B3",
  vibrant_green = "#b5f3bd",
  nord_blue = "#86b9c2",
  blue = "#8bbec7",
  yellow = "#f6c177",
  sun = "#fec97f",
  purple = "#c4a7e7",
  dark_purple = "#bb9ede",
  teal = "#6aadc8",
  orange = "#f6c177",
  cyan = "#a3d6df",
  statusline_bg = "#201e2b",
  lightbg = "#2d2b38",
  pmenu_bg = "#c4a7e7",
  folder_bg = "#6aadc8",
}

M.base_16 = {
  base00 = "#11111B",
  base01 = "#11111B",
  base02 = "#26233a",
  base03 = "#6e6a86",
  base04 = "#908caa",
  base05 = "#e0def4",
  base06 = "#e0def4",
  base07 = "#524f67",
  base08 = "#eb6f92",
  base09 = "#f6c177",
  base0A = "#ebbcba",
  base0B = "#31748f",
  base0C = "#9ccfd8",
  base0D = "#c4a7e7",
  base0E = "#f6c177",
  base0F = "#524f67",
}

M = require("base46").override_theme(M, "rosepine")

M.type = "dark"

return M
