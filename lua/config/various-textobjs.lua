-- default config
require("various-textobjs").setup({
    -- lines to seek forwards for "small" textobjs (most characterwise)
    -- set to 0 to only look in the current line
    lookForwardSmall = 5,

    -- lines to seek forwards for "big" textobjs
    -- (linewise textobjs and the url textobj)
    lookForwardBig = 15,

    -- use suggested keymaps (see README)
    useDefaultKeymaps = false,
})
