---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.indent_blankline then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    IblIndent = { fg = palette.space_cadet },
    IblScope = { fg = palette.cyber_grape },
  }
end

return hl_src
