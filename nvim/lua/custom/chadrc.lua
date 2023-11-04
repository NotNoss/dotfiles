---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'oxocarbon',

  hl_override = {
    NvDashAscii = {
      bg = "none",
      fg = "blue",
    },
  },

  statusline = {
    theme = "minimal",
    separator = "block",
    overriden_modules = nil,
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
