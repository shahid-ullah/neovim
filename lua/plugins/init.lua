return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "raimon49/requirements.txt.vim",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim",            tag = "0.1.5" },
    'LukasPietzschmann/telescope-tabs',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "junegunn/fzf",                             build = ":call fzf#install()" },
    "junegunn/fzf.vim",
    'mrjones2014/smart-splits.nvim',
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
            require('mason').setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 'mason.nvim' },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            })
        end,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- 'SirVer/ultisnips',
    -- 'quangnguyen30192/cmp-nvim-ultisnips',
    -- {
    --     'tzachar/cmp-tabnine',
    --     build = './install.sh',
    --     dependencies = 'hrsh7th/nvim-cmp',
    -- },
    -- { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },
    -- tthemes
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    "sainnhe/gruvbox-material",
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    -- 'girishji/vimsuggest',
    'ludovicchabant/vim-gutentags',
    { 'echasnovski/mini.ai', version = '*' },
    'sbdchd/neoformat'
}
