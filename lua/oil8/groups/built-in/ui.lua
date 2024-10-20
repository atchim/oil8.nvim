---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    -- Cursor
    Cursor = { reverse = true },
    CursorColumn = { bg = palette.dark_gunmetal },
    CursorLine = { link = 'CursorColumn' },

    -- Floating Window
    FloatBorder = { link = 'WinSeparator' },
    FloatFooter = { fg = palette.jungle_green },
    NormalFloat = { bg = palette.dark_gunmetal },

    -- Fold
    FoldColumn = { link = 'LineNr' },
    Folded = {
      fg = palette.antique_fuchsia,
      bg = palette.space_cadet,
      bold = true,
    },

    -- Line Number & Sign Column
    CursorLineNr = { fg = palette.burnished_brown, bold = true },
    LineNr = { fg = palette.antique_fuchsia },
    SignColumn = { link = 'LineNr' },

    -- Menu
    Pmenu = { fg = palette.burnished_brown, bg = palette.dark_gunmetal },
    PmenuSBar = { bg = palette.space_cadet },
    PmenuSel = { bg = palette.cyber_grape },
    PmenuThumb = { link = 'PmenuSel' },
    WildMenu = { fg = palette.ecru, bold = true, bg = palette.cyber_grape },

    -- Status & Tab Lines
    StatusLine = {
      fg = palette.burnished_brown,
      bg = palette.space_cadet,
      bold = true,
    },
    StatusLineNC = {
      fg = palette.antique_fuchsia,
      bg = palette.dark_gunmetal,
      bold = true,
    },
    TabLineSel = { link = 'StatusLine' },

    -- Window
    WinBar = { link = 'StatusLine' },
    WinBarNC = { link = 'StatusLineNC' },
    WinSeparator = { fg = palette.cyber_grape, bg = palette.space_cadet },

    -- Misc
    ColorColumn = { bg = palette.space_cadet },
    Directory = { fg = palette.violets_are_blue },
    NonText = { fg = palette.cyber_grape, bold = true },
    Title = { fg = palette.turquoise, bold = true },
  }
end

return hl_src
