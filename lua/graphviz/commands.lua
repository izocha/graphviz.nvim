local utils = require("graphviz.utils")

local M = {}

function M.graph_preview(format)
	local buf_name, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_name .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
	utils.on_save(command)
end

function M.graph_export(format)
	local buf_name, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_name .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
end

return M
