-- Setup nvim-cmp.

local status_ok, _ = pcall(require, "cmp")
if not status_ok then
    print('cmp is not installed')
    return
end
-- local lspkind = require("lspkind")
-- lspkind.init()
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        { name = "ultisnips" },
        { name = "cmp_tabnine" },
    }, {
        { name = "buffer" },
        { name = "calc" },
    }),

    -- formatting = {
    --     format = lspkind.cmp_format(),
    -- },

    -- formatting = {
    --   format = lspkind.cmp_format({
    --     mode = 'symbol', -- show only symbol annotations
    --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

    --     -- The function below will be called before any actual modifications from lspkind
    --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    --     before = function (entry, vim_item)
    --       ...
    --       return vim_item
    --     end
    --   })
    -- },
})
