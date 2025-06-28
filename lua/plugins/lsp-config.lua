return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
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
                    "lua_ls",
                    "pyright",
                    "bashls",
                    "html",
                    "clangd",
                    "yamlls",
                    "dockerls",
                    "docker_compose_language_service"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua
            lspconfig.lua_ls.setup({})

            -- Python
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoImportCompletions = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            -- Bash
            lspconfig.bashls.setup({})

            -- HTML
            lspconfig.html.setup({})

            -- C/C++
            lspconfig.clangd.setup({})

            -- YAML
            lspconfig.yamlls.setup({})

            -- Docker
            lspconfig.dockerls.setup({})
            lspconfig.docker_compose_language_service.setup({})

            -- Keymaps
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end
    }
}
