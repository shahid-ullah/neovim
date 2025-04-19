local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("Telescope loading error")
    return
end

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "venv", "tags", "migrations", "packer_compiled.lua", "__pycache__" },
        prompt_prefix = " >",
        color_devicons = true,
        sorting_strategy = "descending",
        selection_strategy = "reset",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.9,
            },
            -- vertical = {
            --         prompt_position = "top",
            --         mirror = true,
            --       },
            --  vertical = {
            --      mirror = false,
            --  },
            --  width = 0.87,
            --  height = 0.80,
            --  preview_cutoff = 120,
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {

            n = {
                ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
                ["<C-q>"] = actions.smart_send_to_qflist,
                ["<C-u>"] = false,
                ["<M-p>"] = action_layout.toggle_preview,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
    },
    pickers = {
        grep_string = {
            initial_mode = "normal",
        },
        lsp_references = {
            initial_mode = "normal",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        -- undo = {
        --     side_by_side = true,
        --     layout_strategy = "vertical",
        --     layout_config = {
        --         preview_height = 0.8,
        --     },
        -- },
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    }
})
require("telescope").load_extension("fzf")
