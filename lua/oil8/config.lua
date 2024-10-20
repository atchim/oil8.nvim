---@class oil8.config.Mini
---@field indentscope boolean

---@class oil8.config.Mini.Partial
---@field indentscope? boolean

---@class oil8.config.Integrations
---@field illuminate boolean
---@field indent_blankline boolean
---@field leap boolean
---@field mini oil8.config.Mini | false
---@field neo_tree boolean
---@field treesitter boolean

---@class oil8.config.Integrations.Partial
---@field illuminate? boolean
---@field indent_blankline? boolean
---@field leap? boolean
---@field mini? oil8.config.Mini.Partial | false
---@field neo_tree? boolean
---@field treesitter? boolean

---@class oil8.config.Config
---@field hl_src? Oil8HighlightSource
---@field integrations oil8.config.Integrations | false
---@field palette Oil8Palette
---@field term_colors boolean

---@alias Oil8ResolvedConfig oil8.config.Config

---@class oil8.config.Config.Partial
---@field hl_src? Oil8HighlightSource
---@field integrations? oil8.config.Integrations.Partial | false
---@field palette? oil8.palette.Palette.Partial
---@field term_colors? boolean

---@alias Oil8Config oil8.config.Config.Partial

---@type Oil8ResolvedConfig
local defaults = {
  integrations = {
    illuminate = true,
    indent_blankline = true,
    leap = true,
    mini = { indentscope = true },
    neo_tree = true,
    treesitter = true,
  },
  palette = require('oil8.palette'),
  term_colors = true,
}

---@type Oil8ResolvedConfig
local config = defaults

---@class oil8.config: oil8.config.Config
local M = {}

---@param partial? Oil8Config
---@return Oil8ResolvedConfig
function M.resolve(partial)
  config = vim.tbl_deep_extend('keep', partial or {}, defaults) --[[@as Oil8ResolvedConfig]]
  return config
end

setmetatable(M, {
  __index = function(_, option)
    return config[option]
  end,
})

return M