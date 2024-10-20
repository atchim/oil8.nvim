---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    CurSearch = { link = 'IncSearch' },
    IncSearch = { bg = palette.pixie_powder, bold = true },
    MatchParen = {
      fg = palette.turquoise,
      bg = palette.brunswick_green,
      bold = true,
      italic = true,
    },
    Search = { bg = palette.bronze_yellow, bold = true },
    Visual = { bg = palette.cyber_grape, bold = true },
  }
end

return hl_src
