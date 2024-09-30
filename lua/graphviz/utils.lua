local M = {}

M.group = vim.api.nvim_create_augroup("Graphs", { clear = false })
---On save autommand for graphviz preview with utils.export()
---@param command table command to run with utils.export()
function M.on_save(command)
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = M.group,
		pattern = { "*.dot", "*.gv" },
		callback = function()
			vim.system(command, { stdin = true }, function(out)
				if out.stderr ~= "" then
					vim.notify(out.stderr, vim.log.levels.ERROR)
				else
					vim.notify("Graph exported", vim.log.levels.INFO)
				end
			end)
		end,
		desc = "Auto dot command on save",
	})
end

function M.get_file()
	local buf_path = vim.api.nvim_buf_get_name(0)
	local buf_name = vim.split(buf_path, "/", { trimempty = true })
	-- local buf_name = buf_name[#buf_name]
	local output = vim.split(buf_name[#buf_name], ".", { plain = true })
	return output[1], buf_path
end

---Take dot command to export diagrams
---@param command table dot command to export diagram
function M.export(command)
	if command[1] == "dot" then
		vim.system(command, { stdin = true, text = true }, function(out)
			if out.stderr ~= "" then
				vim.notify(out.stderr, vim.log.levels.ERROR)
			else
				vim.notify("Graph exported", vim.log.levels.INFO)
			end
			vim.ui.open(command[#command])
		end)
	end
end

function M.args_complete()
	return { "ps", "pdf", "svg", "fig", "png", "json", "webp" }
end

-- function M.notification(message, level)
-- 	vim.notify(message, level, {
-- 		title = "graphviz.nvim",
-- 	})
-- end

---Verify existence of exported file and open it if exists
---@param file string File's path to Verify
---@return boolean
-- function M.open_file(file)
-- 	if
-- 		vim.wait(5000, function()
-- 			if vim.fn.filereadable(file) == 1 then
-- 				vim.notify_once("Graph exported!", vim.log.levels.ERROR)
-- 				return true
-- 			else
-- 				vim.notify_once("No files detected!", vim.log.levels.ERROR)
-- 				return false
-- 			end
-- 		end, 2500)
-- 	then
-- 		vim.ui.open(file)
-- 	end
-- 	return true
-- end

return M
