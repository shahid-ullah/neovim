local status_ok, nvim_transparent = pcall(require, "nvim_transparent")
if not status_ok then
	return
end

-- require("setup.nvim_transparent")
require("github-theme").setup({})
