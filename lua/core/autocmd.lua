-- Clear buffer on quit(win close) :q
vim.api.nvim_create_autocmd('WinClosed', {
	callback = function(tbl)
		if tbl.args ~= nil then
			vim.api.nvim_command('BufferClose ' .. tbl.args)
		end
	end,
	group = vim.api.nvim_create_augroup('barbar_close_buf', {})
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- format on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmtGroup,
	pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py", "*.nix" },
	command = "lua vim.lsp.buf.format({ async = false })",
})

-- Open Dashboard
vim.api.nvim_set_keymap('n', '<Leader>d', ':Dashboard<CR>', { noremap = true, silent = true })

-- Open File Browser
vim.api.nvim_set_keymap('n', '<Leader>fo', ':Telescope file_browser<CR>', { noremap = true, silent = true })
