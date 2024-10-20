---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.mini then
    return
  end

  ---@type Oil8HighlightSource
  return {
    require('oil8.groups.integrations.mini.indentscope'),
  }
end

return hl_src