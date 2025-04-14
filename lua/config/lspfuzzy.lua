-- config/lspfuzzy.lua
local status_ok, lspfuzzy = pcall(require, "lspfuzzy")
if not status_ok then
	return
end
require("lspfuzzy").setup({})
