local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print('lspconfig not installed')
    return
end
local nvim_lsp = require("lspconfig")
-- local util = require("vim.lsp.util")

-- see `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- if client.name == "tsserver" then
    --     client.server_capabilities.document_formatting = false
    -- end

    -- if client.name == "html" then
    --     client.server_capabilities.document_formatting = false
    -- end


	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--[[ vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts) ]]
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>t", function()
		require("telescope.builtin").lsp_document_symbols()
	end, bufopts)
	vim.keymap.set("n", "<space>ct", function()
		require("telescope.builtin").lsp_document_symbols({ symbols = { "function", "class" } })
	end, bufopts)
	vim.keymap.set("n", "<space>mt", function()
		require("telescope.builtin").lsp_document_symbols({ symbols = { "method" } })
	end, bufopts)
	vim.keymap.set("n", "<space>vt", function()
		require("telescope.builtin").lsp_document_symbols({ symbols = { "variable" } })
	end, bufopts)
	vim.keymap.set("n", "<S-t>", function()
		require("telescope.builtin").lsp_dynamic_workspace_symbols()
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	--[[ vim.keymap.set("n", "<space>vf", vim.lsp.buf.formatting, bufopts) ]]
end

-- local servers = { "eslint", "bashls", "cssls", "cssmodules_ls", "html", "vimls" }
local servers = { "bashls", "cssls", "cssmodules_ls", "html", "vimls" }
-- local lsp_flags = {
--     -- This is the default in Nvim 0.7+
--     debounce_text_changes = 150,
-- }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        --[[ flags = lsp_flags, ]]
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })
end

-- Python

require("lspconfig")["pyright"].setup({
    on_attach = on_attach,
    --[[ flags = lsp_flags, ]]
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})

--require("lspconfig")["pyright"].setup({
--    on_attach = on_attach,
--    --[[ flags = lsp_flags, ]]
--    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--})

--require("lspconfig")["pylsp"].setup({
--    on_attach = on_attach,
--    --[[ flags = lsp_flags, ]]
--    capabilities = require("cmp_nvim_lsp").default_capabilities(),
--})


--require("lspconfig")["basedpyright"].setup({
--    on_attach = on_attach,
--    --[[ flags = lsp_flags, ]]
--    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--})

--require("lspconfig")["pylyzer"].setup({
--    on_attach = on_attach,
--    --[[ flags = lsp_flags, ]]
--    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--})


-- typescript
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    --[[ flags = lsp_flags, ]]
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- vim
require("lspconfig").vimls.setup({
    on_attach = on_attach,
    --[[ flags = lsp_flags, ]]
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- markdown
require'lspconfig'.markdown_oxide.setup{
    on_attach = on_attach,
    --[[ flags = lsp_flags, ]]
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

--require'lspconfig'.marksman.setup{
--    on_attach = on_attach,
--    --[[ flags = lsp_flags, ]]
--    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--}

-- lua
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
})

-- vim.diagnostic.config({
--     virtual_text = {
--         source = "always", -- Or "if_many"
--         prefix = "■", -- Could be '●', '▎', 'x'
--     },
--     float = {
--         source = "always", -- Or "if_many"
--     },
-- })
