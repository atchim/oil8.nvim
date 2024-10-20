---@type Oil8HighlightSource
local hl_src = function(config)
  if not config.term_colors then
    return
  end

  local palette = config.palette

  -- stylua: ignore
  local term_vars = {
    terminal_color_0  = palette.eerie_black,
    terminal_color_1  = palette.english_red,
    terminal_color_2  = palette.green_ryb,
    terminal_color_3  = palette.acid_green,
    terminal_color_4  = palette.steel_blue,
    terminal_color_5  = palette.byzantine,
    terminal_color_6  = palette.jungle_green,
    terminal_color_7  = palette.ecru,
    terminal_color_8  = palette.cyber_grape,
    terminal_color_9  = palette.brink_pink,
    terminal_color_10 = palette.mantis,
    terminal_color_11 = palette.chinese_green,
    terminal_color_12 = palette.blue_jeans,
    terminal_color_13 = palette.light_deep_pink,
    terminal_color_14 = palette.turquoise,
    terminal_color_15 = palette.bone,
  }

  for var, color in pairs(term_vars) do
    vim.g[var] = color
  end
end

return hl_src
