local utils = require("graphviz.utils")

local M = {}

function M.graph_preview(format)
	local _, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_path .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
	utils.on_save(command)
end

function M.graph_export(format)
	local _, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_path .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
end

return M
