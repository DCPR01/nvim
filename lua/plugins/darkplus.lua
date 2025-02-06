return {
    {
        "lunarvim/darkplus.nvim",
        lazy = false, -- Load immediately
        priority = 1000, -- Load before other plugins
        config = function()
            -- Apply the DarkPlus color scheme
            vim.cmd("colorscheme darkplus")

            -- Optional: Set transparency
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        end
    }
}
