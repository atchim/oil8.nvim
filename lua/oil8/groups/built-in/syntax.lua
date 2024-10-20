---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    Boolean = { fg = palette.macaroni_and_cheese },
    Character = { fg = palette.medium_aquamarine },
    Comment = { fg = palette.burnished_brown },
    Conceal = { fg = palette.blue_pigment, italic = true },
    Constant = { fg = palette.big_foot_feet },
    Delimiter = { fg = palette.jungle_green, bold = true },
    Error = { fg = palette.brink_pink, bold = true, reverse = true },
    Float = { fg = palette.inchworm },
    Function = { link = 'Identifier' },
    Identifier = { fg = palette.blue_jeans },
    Ignore = {},
    Label = { fg = palette.mauve },
    Normal = { fg = palette.bone, bg = palette.eerie_black },
    Number = { fg = palette.chinese_green },
    Operator = { link = 'Special' },
    Preproc = { fg = palette.brink_pink },
    Special = { fg = palette.turquoise },
    SpecialKey = { fg = palette.turquoise, italic = true },
    Statement = { fg = palette.light_deep_pink },
    String = { fg = palette.mantis },
    Tag = { fg = palette.mauve },
    Todo = { fg = palette.violets_are_blue, bold = true, reverse = true },
    Type = { fg = palette.violets_are_blue },
    Underlined = { underline = true },
  }
end

return hl_src
