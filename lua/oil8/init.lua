local hi = vim.api.nvim_set_hl

---@param groups Oil8HighlightGroups
local function hi_groups(groups)
  for name, args in pairs(groups) do
    hi(0, name, args)
  end
end

---@param src Oil8HighlightSource
---@param config Oil8ResolvedConfig
local function hi_src(src, config)
  if type(src) == 'function' then
    local subsrc = src(config)
    if subsrc then
      hi_src(subsrc, config)
    end
  elseif #src > 0 then
    for _, subsrc in ipairs(src) do
      hi_src(subsrc, config)
    end
  else
    hi_groups(src)
  end
end

local M = {}

---@param partial_config? Oil8Config
function M.setup(partial_config)
  ---@diagnostic disable-next-line: undefined-field
  if not vim.opt.termguicolors:get() then
    vim.notify("oil8: 'termguicolors' is not set", vim.log.levels.ERROR, {})
    return
  end

  if vim.opt.background:get() ~= 'dark' then
    vim.notify([[oil8: 'background' is not "dark"]], vim.log.levels.WARN, {})
  end

  vim.cmd('hi clear')
  if vim.fn.exists('syntax') then
    vim.cmd('syntax reset')
  end
  vim.g.colors_name = 'oil8'

  local config = require('oil8.config').resolve(partial_config)
  hi_src(require('oil8.groups'), config)

  if config.hl_src then
    hi_src(config.hl_src, config)
  end
end

return M
