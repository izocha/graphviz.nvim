local M = {}
---On save autommand for graphviz preview with utils.export()
---@param command table command to run with utils.export()
function M.on_save(command)
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("Graphs", { clear = true }),
		pattern = { "*.dot", "*.gv" },
		callback = function()
			vim.fn.jobstart(command)
			M.notification("Graph exported")
		end,
		desc = "Auto dot command on save",
	})

	M.notification("Please wait..", vim.log.levels.INFO)
end

function M.get_file()
	local buf_path = vim.api.nvim_buf_get_name(0)
	local buf_name = vim.split(buf_path, "/", { trimempty = true })
	local buf_name = buf_name[#buf_name]
	local output = vim.split(buf_name, ".", { plain = true })
	return output[1], buf_path
end
---Take dot command to export diagrams
---@param command table dot command to export diagram
function M.export(command)
	if command[1] == "dot" then
		vim.fn.jobstart(command)
	end
end

function M.args_complete()
	return { "ps", "pdf", "svg", "fig", "png", "json", "webp" }
end

function M.notification(message, level)
	vim.notify(message, level, {
		title = "graphviz.nvim",
	})
end

---Verify existence of exported file
---@param file string File's path to Verify
---@return boolean
function M.have_file(file)
	if vim.fn.filereadable(file) == 1 then
		M.notification("Exportation succeed!", vim.log.levels.INFO)
		return true
	else
		-- M.notification("Something goes wrong!", 4)
		return false
	end
	-- return true
end

return M
