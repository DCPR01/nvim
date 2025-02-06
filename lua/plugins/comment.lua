return {
    {
        "numToStr/Comment.nvim",
        lazy = false, -- Load on startup
        config = function()
            local comment = require("Comment")

            comment.setup({
                mappings = {
                    basic = true, -- Enable normal mode `gc`
                    extra = false, -- Disable extra mappings
                },
            })

            -- ✅ Ensure correct behavior for toggling comments
            local api = require("Comment.api")

            -- ✅ Normal Mode: Toggle comment on the current line
            vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { noremap = true, silent = true })
            vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { noremap = true, silent = true }) -- Alternative

            -- ✅ Fix for Visual Mode: Properly toggle comments instead of adding them
            vim.keymap.set("x", "<C-/>", function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false) -- Exit visual mode
                api.toggle.linewise(vim.fn.visualmode()) -- Toggle (not add)
            end, { noremap = true, silent = true })

            vim.keymap.set("x", "<C-_>", function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false) -- Exit visual mode
                api.toggle.linewise(vim.fn.visualmode()) -- Alternative shortcut
            end, { noremap = true, silent = true })
        end
    }
}
