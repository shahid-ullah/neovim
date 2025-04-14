local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    sources = {
        -- require("null-ls").builtins.formatting.yapf,
        -- require("null-ls").builtins.formatting.black,
        -- require("null-ls").builtins.formatting.autopep8,
        -- require("null-ls").builtins.formatting.isort,
        -- require("null-ls").builtins.formatting.djlint,
        -- require("null-ls").builtins.diagnostics.mypy,
        -- require("null-ls").builtins.diagnostics.pylint,
        -- require("null-ls").builtins.diagnostics.flake8,
        -- require("null-ls").builtins.diagnostics.ruff,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier.with({
            filetypes = { "javascript", "css", "html", "json", "yaml" },
            disabled_filetypes = { "markdown" },
        }),
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
})
