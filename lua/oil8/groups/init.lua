---@class Oil8HighlightGroups: { [string]: vim.api.keyset.highlight }

---@alias Oil8HighlightSourceFn fun(config: Oil8ResolvedConfig): Oil8HighlightSource?

---@alias Oil8HighlightSource Oil8HighlightGroups | Oil8HighlightSourceFn | Oil8HighlightSource[]

---@type Oil8HighlightSource
return {
  require('oil8.groups.built-in'),
  require('oil8.groups.integrations'),
}