return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for completion
            "hrsh7th/cmp-buffer",   -- Completion from current buffer
            "hrsh7th/cmp-path",     -- File path completion
            "L3MON4D3/LuaSnip",     -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completions
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), -- Open completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm completion
                    ["<Tab>"] = cmp.mapping.select_next_item(), -- Navigate down
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Navigate up
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Use LSP for completions
                    { name = "buffer" },   -- Suggest words from current file
                    { name = "path" },     -- Suggest file paths
                    { name = "luasnip" },  -- Snippet support
                }),
            })
        end,
    }
}
