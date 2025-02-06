return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- Auto-update Mason registry
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "clangd", "cmake", "cssls", "html", "pyright", "bashls" -- ✅ Includes Bash, HTML, and CSS LSPs
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            -- ✅ Lua Language Server
            lspconfig.lua_ls.setup({})

            -- ✅ Python LSP (Pyright)
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
                            autoImportCompletions = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            -- ✅ C/C++ LSP (Clangd)
            lspconfig.clangd.setup({})

            -- ✅ HTML LSP
            lspconfig.html.setup({})

            -- ✅ CSS LSP
            lspconfig.cssls.setup({})

            -- ✅ Bash LSP
            lspconfig.bashls.setup({})

            -- ✅ Keybindings for LSP
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show hover info
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Show references
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename variable
        end
    }
}
