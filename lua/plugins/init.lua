return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"raimon49/requirements.txt.vim",
	"nvim-lua/plenary.nvim",
	-- searching, greeping
	-- { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
	{ "nvim-telescope/telescope.nvim" },
	"LukasPietzschmann/telescope-tabs",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "junegunn/fzf", build = ":call fzf#install()" },
	"junegunn/fzf.vim",

	"mrjones2014/smart-splits.nvim",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"ur4ltz/surround.nvim",
	"wellle/targets.vim",
	"tpope/vim-unimpaired",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"szw/vim-maximizer",
	"nvim-lualine/lualine.nvim",
	"kyazdani42/nvim-tree.lua",
	"nacro90/numb.nvim",
	-- "nvim-tree/nvim-web-devicons",
	"andymass/vim-matchup",
	"preservim/vim-markdown",
	-- "windwp/nvim-autopairs",
	"akinsho/toggleterm.nvim",
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("colorful-winsep").setup()
		end,
	},
	-- LSP setup
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},

	-- autosuggestion|completion

	-- 'hrsh7th/cmp-nvim-lsp',
	-- 'hrsh7th/cmp-buffer',
	-- 'hrsh7th/cmp-path',
	-- 'hrsh7th/cmp-cmdline',
	-- 'hrsh7th/nvim-cmp',
	-- 'SirVer/ultisnips',
	-- 'quangnguyen30192/cmp-nvim-ultisnips',
	-- {
	--     'tzachar/cmp-tabnine',
	--     build = './install.sh',
	--     dependencies = 'hrsh7th/nvim-cmp',
	-- },
	-- { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },

	-- themes
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
	"sainnhe/gruvbox-material",
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	-- 'girishji/vimsuggest',
	"ludovicchabant/vim-gutentags",
	{ "echasnovski/mini.ai", version = "*" },
	"sbdchd/neoformat",
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
		"echasnovski/mini.pick", -- optional
	},
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("dashboard").setup({
	-- 			-- config
	-- 		})
	-- 	end,
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- },
	{
		"Dan7h3x/signup.nvim",
		branch = "main",
		opts = {
			-- Your configuration options here
		},
		config = function(_, opts)
			require("signup").setup(opts)
		end,
	},

	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"wurli/visimatch.nvim",
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	{
		"linrongbin16/fzfx.nvim",
		-- Optional to avoid break changes between major versions.
		version = "v8.*",
		dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
		config = function()
			require("fzfx").setup()
		end,
	},
	"ctrlpvim/ctrlp.vim",
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"mcauley-penney/tidy.nvim",
		opts = {
			enabled_on_save = true,
			filetype_exclude = { "diff" },
		},
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			require("symbol-usage").setup()
		end,
	},
	{ "mfussenegger/nvim-lint" },
	{ "kevinhwang91/nvim-bqf" },
}
