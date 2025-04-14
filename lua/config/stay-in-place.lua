local status_ok, stay_in_place = pcall(require, "stay-in-place")
if not status_ok then
    return
end

require("stay-in-place").setup({})
