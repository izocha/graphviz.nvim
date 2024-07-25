local utils = require("graphviz.utils")

local M = {}

M.graph_preview = function(format)
	local buf_name, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_name .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
	utils.on_save(command)
	--open files if it's Possible
	utils.have_file(output)
	if vim.wait(5000, function()
		return utils.have_file(output)
	end, 2500) then
		vim.ui.open(output)
	end
end

M.graph_export = function(format)
	local buf_name, buf_path = utils.get_file()
	local format_arg = "-T" .. format
	local output = buf_name .. "." .. format
	local command = { "dot", buf_path, format_arg, "-o", output }
	utils.export(command)
	if vim.wait(5000, function()
		return utils.have_file(output)
	end, 2500) then
		vim.ui.open(output)
	else
		M.notification("Something goes wrong!", 4)
	end
	-- utils.have_file(output)
	--open file if it's possible
end

return M
