---@type Oil8HighlightSource
local hl_src = function(config)
  local palette = config.palette
  ---@type Oil8HighlightGroups
  return {
    -- Document Highlight
    LspReferenceRead = { link = 'LspReferenceText' },
    LspReferenceTarget = { link = 'LspReferenceText' },
    LspReferenceText = { bg = palette.space_cadet },
    LspReferenceWrite = { link = 'LspReferenceText' },

    -- Virtual Text
    LspCodeLens = { fg = palette.cyber_grape, italic = true },
    LspCodeLensSeparator = { fg = palette.cyber_grape },
    LspInlayHint = { fg = palette.cyber_grape, italic = true },

    -- Signature Help
    LspSignatureActiveParameter = { fg = palette.turquoise, bold = true },
  }
end

return hl_src
