---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.neo_tree then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    -- Git
    NeoTreeGitAdded = { fg = palette.mantis },
    NeoTreeGitConflict = { fg = palette.brink_pink, bold = true },
    NeoTreeGitDeleted = { fg = palette.english_red },
    NeoTreeGitModified = { fg = palette.chinese_green },
    NeoTreeGitUntracked = { fg = palette.big_foot_feet },

    -- Labels
    NeoTreeDotfile = { fg = palette.cyber_grape },
    NeoTreeFileStats = { link = 'NeoTreeDotfile' },
    NeoTreeFileStatsHeader = { fg = palette.violets_are_blue, bold = true },
    NeoTreeMessage = { link = 'NeoTreeDotfile' },
    NeoTreeRootName = { fg = palette.light_deep_pink, bold = true },
    NeoTreeTitleBar = {
      fg = palette.bone,
      bg = palette.cyber_grape,
      bold = true,
    },

    -- Tabs
    NeoTreeTabActive = {
      fg = palette.ecru,
      bg = palette.dark_gunmetal,
      bold = true,
    },
    NeoTreeTabInactive = {
      fg = palette.antique_fuchsia,
      bg = palette.eerie_black,
      bold = true,
    },
    NeoTreeTabSeparatorActive = {
      fg = palette.dark_gunmetal,
      bg = palette.dark_gunmetal,
      bold = true,
    },
    NeoTreeTabSeparatorInactive = {
      fg = palette.eerie_black,
      bg = palette.eerie_black,
      bold = true,
    },

    -- UI
    NeoTreeCursorLine = { bg = palette.space_cadet },
    NeoTreeDimText = { link = 'NonText' },
    NeoTreeNormal = { bg = palette.dark_gunmetal },
    NeoTreeNormalNC = { link = 'NeoTreeNormal' },
    NeoTreeWinSeparator = {
      fg = palette.cyber_grape,
      bg = palette.dark_gunmetal,
    },
  }
end

return hl_src
