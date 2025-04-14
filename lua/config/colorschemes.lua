-- lua/config/colorschemes.lua
package.loaded["config.colorschemes"] = nil

-- for night

-- vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme ros-pine")

-- PaperColor setup
vim.cmd([[
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
]])
-- vim.cmd("colorscheme PaperColor")

-- vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme vscode")
-- vim.cmd("colorscheme tokyonight")
