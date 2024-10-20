---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    -- File
    diffAdded = { fg = palette.mantis },
    diffChanged = { fg = palette.big_foot_feet },
    diffFile = { link = 'Comment' },
    diffLine = { fg = palette.light_deep_pink },
    diffRemoved = { fg = palette.brink_pink },
    diffSubname = { fg = palette.violets_are_blue },

    -- Line
    Added = { fg = palette.green_ryb },
    Changed = { fg = palette.dirty_brown },
    Removed = { fg = palette.english_red },

    -- Mode
    DiffAdd = { bg = palette.kombu_green },
    DiffChange = { bg = palette.dark_lava },
    DiffDelete = { bg = palette.caput_mortuum },
    DiffText = { bg = palette.bronze_yellow, bold = true },
  }
end

return hl_src
