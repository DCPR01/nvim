
return {
    {
        "mg979/vim-visual-multi",
        branch = "master",
        config = function()
            -- Disable default mappings so we can define our own
            vim.g.VM_default_mappings = 0 

            -- ✅ Use `<C-j>` for adding a cursor below
            vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", { noremap = true, silent = true })

            -- ✅ Use `<C-k>` for adding a cursor above
            vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", { noremap = true, silent = true })

            -- ✅ Use `<C-S-/>` for regex search
            vim.keymap.set("n", "<C-s>", "<Plug>(VM-Start-Regex-Search)", { noremap = true, silent = true }) 

            -- ✅ Remove last cursor
            vim.keymap.set("n", "<C-d>", "<Plug>(VM-Remove-Cursor)", { noremap = true, silent = true }) 

            -- ✅ Set Visual Multi Highlights to Light Magenta
            vim.api.nvim_set_hl(0, "VM_Extend", { fg = "#FF80FF", bg = "#441044" })
            vim.api.nvim_set_hl(0, "VM_Cursor", { fg = "#FF80FF", bg = "#441044" })
            vim.api.nvim_set_hl(0, "VM_Mono", { fg = "#FF80FF", bg = "#441044" })
        end
    }
}
