local M = {
	"Shatur/neovim-ayu",
}

M.config = function()
	local ayu = require("ayu")

	-- setup must be called before loading the colorscheme
	ayu.setup({
		mirage = false,
		terminal = true,
	})

	vim.cmd("colorscheme ayu")
end

return M
