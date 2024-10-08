local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.o.guifont = "Source Code Pro:h12" 

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup("plugins", {
	install = {
		colorscheme = { "ayu-dark" },
	},
})
