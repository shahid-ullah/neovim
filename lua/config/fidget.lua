-- config/fidget.lua
local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end
require("fidget").setup({})
