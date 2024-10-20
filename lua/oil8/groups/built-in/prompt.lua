---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    ErrorMsg = { fg = palette.brink_pink, bold = true },
    ModeMsg = { fg = palette.bone, bold = true },
    MoreMsg = { fg = palette.mantis, bold = true },
    Question = { fg = palette.chinese_green, bold = true },
    QuickFixLine = { fg = palette.turquoise, bold = true },
    WarningMsg = { fg = palette.big_foot_feet, bold = true },
  }
end

return hl_src
