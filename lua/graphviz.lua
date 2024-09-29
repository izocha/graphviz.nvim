local utils = require("graphviz.utils")
local commands = require("graphviz.commands")
local config = {
	format = "pdf",
	preview = "pdf",
}

local M = {}

M.config = config

function M.setup(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
	M.user_commands()
end

function M.user_commands()
	local buf_user_command = vim.api.nvim_buf_create_user_command
	-- Create commands ONLY for dot files
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "dot",
		callback = function()
			buf_user_command(0, "GraphExport", function(opts)
				local args = opts.fargs[1] or M.config.format
				commands.graph_export(args)
			end, {
				desc = "Export graph",
				--NOTE:-- Why "*"?, because this allow me to use default values
				nargs = "*",
				complete = function()
					return utils.args_complete()
				end,
			})

			buf_user_command(0, "GraphPreview", function()
				commands.graph_preview(M.config.preview)
			end, {
				desc = "Graphviz preview with autocommand",
			})
		end,
	})
end

return M
