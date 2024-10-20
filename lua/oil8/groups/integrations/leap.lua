---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.leap then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    LeapLabelPrimary = {
      fg = palette.eerie_black,
      bg = palette.inchworm,
      bold = true,
    },
    LeapLabelSecondary = {
      fg = palette.eerie_black,
      bg = palette.mauve,
      bold = true,
    },
    LeapMatch = { link = 'Search' },
  }
end

return hl_src
