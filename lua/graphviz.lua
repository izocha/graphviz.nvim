---@type Graphviz.config
local defaults = {
	format = "pdf",
	preview = "pdf",
}

---@class Graphviz.config
---@field format string
---@field preview string
local M = {}

M.config = defaults

function M.setup(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

return M
