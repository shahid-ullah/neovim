require("options")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins")
require("mappings")
require("config.initialize")
require("config.telescope")
require("config.smart-splits")
require("config.nvim-treesitter")
require("config.surround")
require("config.gitsigns")
require("config.lualine")
require("config.nvim-tree")
require("config.toggleterm")
require("config.cmp")
-- require("config.tabnine-nvim")

local lsp_cmds = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_cmds,
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = true })
		end
		bufmap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		bufmap("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>")
		bufmap("n", "<leader><leader>f", "<cmd>lua vim.lsp.buf.format()<cr>")
	end,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettier", stop_after_first = true },
		["_"] = { "trim_whitespace" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("lint").linters_by_ft = {
	markdown = { "vale" },
	python = { "ruff", "pylint" },
}

vim.api.nvim_create_autocmd({ "TextChanged" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft` for the current filetype
		require("lint").try_lint()
	end,
})

vim.cmd("source ~/.config/nvim/vim/telescope.vim")
vim.cmd("source ~/.config/nvim/vim/fzf.vim")
vim.cmd("source ~/.config/nvim/vim/vim-maximizer.vim")
vim.cmd("source ~/.config/nvim/vim/general.vim")
vim.cmd("source ~/.config/nvim/vim/maps.vim")

-- vim.opt.foldlevelstart = 99 -- start unfolded
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldminlines = 0 -- Allow closing even 1-line folds.
-- vim.opt.foldexpr = 'v:lua.config.foldexpr(v:lnum)'
-- vim.opt.foldtext = 'v:lua.config.foldtext()'
-- vim.opt.formatoptions = vim.opt.formatoptions + 'j' -- remove comment leader when joining comment lines
-- vim.opt.formatoptions = vim.opt.formatoptions + 'n' -- smart auto-indenting inside numbered lists

-- local indent_wrap_mapping = config.indent_blankline.wrap_mapping
-- Toggle fold at current position.
-- vim.keymap.set('n', '<Tab>', indent_wrap_mapping('za'), { silent = true })

-- Other indent-related remaps for compatibility with indent-blankline.nvim:
-- vim.keymap.set('n', 'zA', indent_wrap_mapping('zA'), { silent = true })
-- vim.keymap.set('n', 'zC', indent_wrap_mapping('zC'), { silent = true })
-- vim.keymap.set('n', 'zM', indent_wrap_mapping('zM'), { silent = true })
-- vim.keymap.set('n', 'zO', indent_wrap_mapping('zO'), { silent = true })
-- vim.keymap.set('n', 'zR', indent_wrap_mapping('zR'), { silent = true })
-- vim.keymap.set('n', 'zX', indent_wrap_mapping('zX'), { silent = true })
-- vim.keymap.set('n', 'za', indent_wrap_mapping('za'), { silent = true })
-- vim.keymap.set('n', 'zc', indent_wrap_mapping('zc'), { silent = true })
-- vim.keymap.set('n', 'zm', indent_wrap_mapping('zm'), { silent = true })
-- vim.keymap.set('n', 'zo', indent_wrap_mapping('zo'), { silent = true })
-- vim.keymap.set('n', 'zr', indent_wrap_mapping('zr'), { silent = true })
-- vim.keymap.set('n', 'zv', indent_wrap_mapping('zv'), { silent = true })
-- vim.keymap.set('n', 'zx', indent_wrap_mapping('zx'), { silent = true })
-- vim.keymap.set('n', '<<', indent_wrap_mapping('<<'), { silent = true })
-- vim.keymap.set('n', '>>', indent_wrap_mapping('>>'), { silent = true })

-- Toggle fold at the current cursor position with <Tab>
vim.keymap.set("n", "<Tab>", "za", { silent = true, noremap = true })
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.cmd([[
    nnoremap H gT
    nnoremap L gt
    set t_Co=256   " This is may or may not needed.
    let &termguicolors = 1
    nnoremap J 5j
    nnoremap K 5k
    nnoremap <leader>j J
    vmap D y'>p
  nnoremap <silent> <leader>g :lua require('telescope-tabs').list_tabs({ initial_mode = "normal" })<CR>
  nnoremap <silent> <A-j> :Gitsigns next_hunk<cr>
  nnoremap <silent> <A-k> :Gitsigns prev_hunk<cr>
  colorscheme gruvbox-material
  silent! unmap <C-s>
]])

-- vim.cmd[[
--     autocmd BufWritePre *.md Neoformat
-- ]]
