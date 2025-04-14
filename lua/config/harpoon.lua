local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<C-u>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)

-- vim.api.nvim_set_keymap('n', '<c-y>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>lua require("telescope").extensions.harpoon.marks()<cr>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua require("harpoon.mark").add_file()<cr>', {noremap=true})
