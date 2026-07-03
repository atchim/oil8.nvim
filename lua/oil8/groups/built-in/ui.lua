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
    FloatTitle = { link = 'Title' },
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
    PmenuBorder = { link = 'FloatBorder' },
    PmenuExtra = { fg = palette.antique_fuchsia, bg = palette.dark_gunmetal },
    PmenuExtraSel = { fg = palette.antique_fuchsia, bg = palette.cyber_grape },
    PmenuKind = { fg = palette.violets_are_blue, bg = palette.dark_gunmetal },
    PmenuKindSel = { fg = palette.violets_are_blue, bg = palette.cyber_grape },
    PmenuMatch = {
      fg = palette.turquoise,
      bg = palette.dark_gunmetal,
      bold = true,
    },
    PmenuMatchSel = {
      fg = palette.turquoise,
      bg = palette.cyber_grape,
      bold = true,
    },
    PmenuSBar = { bg = palette.space_cadet },
    PmenuSel = { bg = palette.cyber_grape },
    PmenuShadow = { bg = palette.eerie_black, blend = 80 },
    PmenuShadowThrough = { bg = palette.eerie_black, blend = 100 },
    PmenuThumb = { link = 'PmenuSel' },
    WildMenu = { fg = palette.ecru, bold = true, bg = palette.cyber_grape },

    -- Completion
    ComplHint = { fg = palette.cyber_grape, italic = true },
    ComplHintMore = { link = 'ComplHint' },
    ComplMatchIns = { fg = palette.turquoise, italic = true },
    PreInsert = { link = 'ComplHint' },

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
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { link = 'StatusLineNC' },
    TabLineFill = { link = 'TabLine' },
    TabLineSel = { link = 'StatusLine' },

    -- Window
    NormalNC = { link = 'Normal' },
    WinBar = { link = 'StatusLine' },
    WinBarNC = { link = 'StatusLineNC' },
    WinSeparator = { fg = palette.cyber_grape, bg = palette.space_cadet },

    -- Message
    MsgArea = { link = 'Normal' },
    MsgSeparator = { link = 'StatusLine' },

    -- Snippet
    SnippetTabstop = { bg = palette.space_cadet },
    SnippetTabstopActive = { bg = palette.cyber_grape, bold = true },

    -- Misc
    ColorColumn = { bg = palette.space_cadet },
    Dimmed = { link = 'Comment' },
    Directory = { fg = palette.violets_are_blue },
    EndOfBuffer = { link = 'NonText' },
    NonText = { fg = palette.cyber_grape, bold = true },
    Title = { fg = palette.turquoise, bold = true },
  }
end

return hl_src
