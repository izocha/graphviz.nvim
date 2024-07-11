local M = {}
---On save autommand for graphviz preview with utils.export()
---@param command table command to run with utils.export()
M.on_save = function(command)
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("Graphs", { clear = true }),
		pattern = { "*.dot", "*.gv" },
		callback = function()
			vim.fn.jobstart(command)
			M.notification("Graph exported")
		end,
		desc = "Auto dot command on save",
	})

	M.notification("Please wait..", 2)
end

M.get_file = function()
	local buf_path = vim.api.nvim_buf_get_name(0)
	local buf_name = vim.split(buf_path, "/", { trimempty = true })
	local buf_name = buf_name[#buf_name]
	local output = vim.split(buf_name, ".", { plain = true })
	return output[1], buf_path
end
---Take dot command to export diagrams
---@param command table dot command to export diagram
M.export = function(command)
	if command[1] == "dot" then
		vim.fn.jobstart(command)
	end
end

M.args_complete = function()
	return { "ps", "pdf", "svg", "fig", "png", "json", "webp" }
end

M.notification = function(message, level)
	vim.notify(message, level, {
		title = "graphviz.nvim",
	})
end

---Verify existence of exported file
---@param file string File's path to Verify
---@return boolean
M.have_file = function(file)
	if vim.fn.filereadable(file) == 1 then
		M.notification("Exportation succeed!")
	else
		M.notification("Something goes wrong!", 4)
	end

	return true
end

return M
