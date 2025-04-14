local actions = require('telescope.actions')
local M = {}

M.RefreshBackground = function()
    vim.opt.termguicolors = true
    vim.api.nvim_exec(
        [[
  highlight cursorlinenr cterm=NONE
  highlight Normal guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
  ]], true)
    end

M.HTMLFormatter =function()
    vim.bo.expandtab = false
    vim.bo.expandtab = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.opt.colorcolumn = {'120'}
    vim.cmd('normal mzgg=G`z')
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
            prompt_title = "< VimRC >",
            cwd = "$HOME/dotfiles/",
        })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
            attach_mappings = function(_, map)
                map('i', '<c-d>', actions.git_delete_branch)
                map('n', '<c-d>', actions.git_delete_branch)
                return true
            end
        })
end

return M
