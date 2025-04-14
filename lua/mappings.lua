-- maps.lua
local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap
-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
-- Select all
-- keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("n", "<leader>s", ":split<Return>", opts)
keymap("n", "<leader>w", ":vsplit<Return>", opts)
keymap("n", "<leader>o", ":only<Return>", opts)


-- map the leader key
keymap("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

keymap("n", "Q", "<nop>", opts)
-- keymap('i', 'jk', '<ESC>l', opts)

keymap("n", "<esc>", ":nohlsearch<cr>", { noremap = true })

-- keymap("n", "<leader>F", "mzgg=G`z", { noremap = true })

keymap("n", ";", ":", { noremap = true })
keymap("v", ";", ":", { noremap = true })
-- keymap("n", "\\", ";", { noremap = true })

-- sometimes this happens and I hate it
keymap("", ":Vs", ":vs", {})
keymap("", ":Sp", ":sp", {})
keymap("n", "<tab>", "gt", { noremap = true })
keymap("n", "<S-tab>", "gT", { noremap = true })
-- keymap("n", "J", "5j", { noremap = true })
-- keymap("n", "K", "5k", { noremap = true })
local silent = { silent = true }
-- vim.keymap.set('n', '<leader>w', '<cmd>w!<cr>')
