return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
        config = function()
            require("oil").setup({
                default_file_explorer = true, -- Replaces netrw
                columns = { "icon" }, -- Show file icons
                keymaps = {
                    ["<CR>"] = "actions.select", -- Open file or enter directory
                    ["<C-v>"] = "actions.select_vsplit", -- Open in vertical split
                    ["<C-x>"] = "actions.select_split", -- Open in horizontal split
                    ["<C-t>"] = "actions.select_tab", -- Open in new tab
                    ["<BS>"] = "actions.parent", -- Go up a directory
                    ["q"] = "actions.close", -- Close oil.nvim
                },
                view_options = {
                    show_hidden = true, -- Show hidden files
                },
            })

            -- ✅ Keybinding to Open Oil with Ctrl+O
            vim.keymap.set("n", "<C-o>", ":Oil<CR>", { noremap = true, silent = true })
        end
    }
}
