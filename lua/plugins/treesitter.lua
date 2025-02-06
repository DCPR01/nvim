return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = "all",
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   config = function()
--     require("nvim-treesitter.configs").setup {
--       ensure_installed = "all",
--       highlight = { enable = true },
--       indent = { enable = true },
--     }
--   end
-- }
