---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    SpellBad = { sp = palette.dirty_brown, undercurl = true, italic = true },
    SpellCap = { sp = palette.byzantine, undercurl = true, italic = true },
    SpellLocal = { sp = palette.acid_green, undercurl = true, italic = true },
    SpellRare = { sp = palette.dirty_brown, undercurl = true, italic = true },
  }
end

return hl_src
