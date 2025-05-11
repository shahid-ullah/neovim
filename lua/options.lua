-----------------------------------------------------------
-- Neovim settings
--- General Neovim settings and configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
-- local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
-- local exec = vim.api.nvim_exec -- execute Vimscript
-- local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
-- local g = vim.g -- a table to access global variables
local opt = vim.opt -- global/buffer/windows-scoped options
-- local map = vim.api.nvim_set_keymap

vim.cmd([[let g:python3_host_prog='/usr/lib/python3']])
vim.opt.path = vim.opt.path + "**"

vim.api.nvim_command("filetype off")
vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("filetype plugin indent on")
vim.api.nvim_command("syntax enable")
vim.api.nvim_command("syntax on")

-- Configurations General

vim.opt.mouse = "a"

vim.o.number = true
-- vim.o.relativenumber = true

vim.o.encoding = "utf-8"

vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.smartcase = true

vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list", "full" } -- Command-line completion mode

vim.opt.wildignore = {
	"*/cache/*",
	"*/tmp/*",
	"*.pyc",
	"*_build/*",
	"**/coverage/*",
	"**/node_modules/*",
	"**/android/*",
	"**/ios/*",
	"**/.git/*",
}

vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.scrolloff = 6

vim.o.laststatus = 2
vim.o.title = true
vim.o.cursorline = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = { "79", "119" }

vim.o.showcmd = true
vim.o.showmode = true

-- swap and backup file options
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.wrap = false
vim.o.linebreak = true

vim.o.foldenable = true
vim.o.foldlevelstart = 10
vim.o.foldnestmax = 10

vim.o.hidden = true
vim.o.confirm = true
vim.o.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

opt.completeopt = { "menuone", "noinsert", "noselect" } -- Completion options (for deoplete)

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.g.blamer_enabled = true
