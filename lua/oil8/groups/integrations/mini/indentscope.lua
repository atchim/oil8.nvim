---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.mini.indentscope then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    MiniIndentscopeSymbol = { fg = palette.cyber_grape },
  }
end

return hl_src
