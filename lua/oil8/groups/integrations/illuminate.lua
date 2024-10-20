---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.illuminate then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    IlluminatedWordRead = { bg = palette.pixie_powder },
    IlluminatedWordText = { bg = palette.ateneo_blue },
    IlluminatedWordWrite = { bg = palette.japanese_violet },
  }
end

return hl_src
