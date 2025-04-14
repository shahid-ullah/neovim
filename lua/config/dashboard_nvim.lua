local home = os.getenv("HOME")
local db = require("dashboard")
db.preview_command = "cat | lolcat -F 0.3"
db.preview_file_path = home .. "/.config/nvim/static/neovim.cat"
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {}
