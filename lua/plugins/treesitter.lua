return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "lua",
        "python",
        "bash",
        "html",
        "c",
        "cpp",
        "yaml",
        "dockerfile"
      },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
