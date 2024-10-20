---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations then
    return
  end

  ---@type Oil8HighlightSource
  return {
    require('oil8.groups.integrations.illuminate'),
    require('oil8.groups.integrations.indent-blankline'),
    require('oil8.groups.integrations.leap'),
    require('oil8.groups.integrations.mini'),
    require('oil8.groups.integrations.neo-tree'),
    require('oil8.groups.integrations.treesitter'),
  }
end

return hl_src
