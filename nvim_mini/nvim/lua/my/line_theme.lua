local M = {}
M.theme = function()
  local colors = {
    green = "#b8bb26",
	none = '',
    white = "#f2e5bc",
    innerbg = "#32302f",
    outerbg = "",
    normal = "",
    insert = "#32302f",
    visual = "#32302f",
    replace = "#32302f",
    command = "#32302f",
  }
  return {
    inactive = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
    visual = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
    replace = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
    normal = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
    insert = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
    command = {
      a = { fg = colors.green, bg = colors.normal, gui = "bold" },
      b = { fg = colors.white, bg = colors.outerbg, gui="bold" },
      c = { fg = colors.white, bg = colors.none , gui="bold"},
    },
  }
end
return M
