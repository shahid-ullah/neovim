local status_ok, nordic = pcall(require, "nordic")
if not status_ok then
	return
end
require("nordic").colorscheme({
	underline_option = "none",
	italic = true,
	italic_comments = false,
	minimal_mode = false,
	alternate_backgrounds = false,
})
