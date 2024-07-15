-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  statusline = {
    --theme = require "my_stl",
    theme = "default",
    separator_style = "block",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp",  "encoding", "my_cursor"},
    modules = {
      my_cursor = " %#St_sep_r# Col %c ",
      encoding = function()
        return vim.opt.fileencoding:get() .. " [0x%B] "
      end,
    }
  },

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

--M.plugins = 'custom.plugins'

return M
