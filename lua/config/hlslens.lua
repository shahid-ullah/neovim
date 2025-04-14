local status_ok, nvim_transparent = pcall(require, "hlslens")
if not status_ok then
	return
end

require("hlslens").setup()
