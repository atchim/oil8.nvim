---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    DiagnosticError = { fg = palette.english_red },
    DiagnosticHint = { fg = palette.green_ryb },
    DiagnosticInfo = { fg = palette.acid_green },
    DiagnosticWarn = { fg = palette.dirty_brown },

    DiagnosticUnderlineError = { sp = palette.english_red, underline = true },
    DiagnosticUnderlineHint = { sp = palette.green_ryb, underline = true },
    DiagnosticUnderlineInfo = { sp = palette.acid_green, underline = true },
    DiagnosticUnderlineWarn = { sp = palette.dirty_brown, underline = true },
  }
end

return hl_src
