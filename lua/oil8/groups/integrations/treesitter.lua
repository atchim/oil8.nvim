---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.integrations.treesitter then
    return
  end

  local palette = config.palette

  ---@type Oil8HighlightGroups
  return {
    -- Comment
    ['@comment.documentation'] = { fg = palette.ecru },
    ['@comment.error'] = {
      fg = palette.brink_pink,
      bold = true,
      reverse = true,
    },
    ['@comment.note'] = {
      fg = palette.turquoise,
      bold = true,
      reverse = true,
    },
    ['@comment.warning'] = {
      fg = palette.big_foot_feet,
      bold = true,
      reverse = true,
    },

    -- Constant
    ['@constant.builtin'] = { link = 'Boolean' },
    ['@constant.macro'] = { fg = palette.tulip },

    -- Keyword
    ['@keyword.conditional.ternary'] = { link = 'Operator' },
    ['@keyword.directive'] = { link = 'Preproc' },
    ['@keyword.import'] = { fg = palette.persian_pink },
    ['@keyword.operator'] = { link = 'Operator' },
    ['@keyword.return'] = { link = '@keyword.import' },

    -- Markup
    ['@markup.link'] = { fg = palette.blue_jeans, underline = true },
    ['@markup.link.vimdoc'] = { fg = palette.persian_pink, underline = true },
    ['@markup.link.label'] = {
      fg = palette.baby_blue_eyes,
      underline = true,
    },
    ['@markup.link.url'] = { fg = palette.middle_blue, underline = true },
    ['@markup.list'] = { link = 'Delimiter' },
    ['@markup.list.checked'] = { fg = palette.mantis },
    ['@markup.list.unchecked'] = { fg = palette.ecru },
    ['@markup.quote'] = { fg = palette.medium_aquamarine },
    ['@markup.raw'] = { fg = palette.macaroni_and_cheese },

    -- String
    ['@string.documentation'] = { fg = palette.medium_aquamarine },
    ['@string.regexp'] = { fg = palette.medium_aquamarine },
    ['@string.special.url'] = { fg = palette.turquoise, underline = true },

    -- Tag
    ['@tag'] = { link = 'Type' },
    ['@tag.attribute'] = { link = '@variable.member' },
    ['@tag.builtin'] = { link = '@type.builtin' },
    ['@tag.delimiter'] = { link = 'htmlTag' },

    -- Variables
    ['@variable'] = { fg = palette.baby_blue_eyes },
    ['@variable.builtin'] = { fg = palette.middle_blue },
    ['@variable.member'] = { link = 'Identifier' },

    -- Misc
    ['@attribute.builtin'] = { fg = palette.tulip },
    ['@constructor'] = { link = '@punctuation' },
    ['@function.macro'] = { fg = palette.brink_pink },
    ['@type.builtin'] = { fg = palette.mauve },
  }
end

return hl_src
