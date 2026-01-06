local cmd = require('utils').custom_user_command

local colorColumnValue = nil
local M = {}

cmd(
	"ToggleColorColumn",
	function()
		if colorColumnValue then
			colorColumnValue = nil
		else
			colorColumnValue = "80"
		end

		vim.cmd(("set colorcolumn=%s"):format(colorColumnValue or ""))
	end
)

M.formattingEnabled = true

cmd(
	"ToggleFormat",
	function()
		M.formattingEnabled = not M.formattingEnabled
		print("Formatting enabled:", M.formattingEnabled)
	end
)
return M
