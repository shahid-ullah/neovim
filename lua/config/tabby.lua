local status_ok, tabby = pcall(require, "tabby")
if not status_ok then
	print('tabby not found.')
	return
end
require("tabby").setup()
