return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
  config = function()
    local oil = require("oil")
    local actions = require("oil.actions")

    oil.setup({
      default_file_explorer = true, -- Replaces netrw
      columns = { "icon" },         -- Show file icons
      view_options = {
        show_hidden = true,         -- Show hidden files
      },
      keymaps = {
        ["<CR>"]    = "actions.select",           -- Open file/directory
        ["<C-v>"]   = "actions.select_vsplit",    -- Vertical split
        ["<C-x>"]   = "actions.select_split",     -- Horizontal split
        ["<C-t>"]   = "actions.select_tab",       -- New tab
        ["<BS>"]    = "actions.parent",           -- Go up one directory
        ["q"]       = "actions.close",            -- Close Oil
        ["<C-CR>"]  = actions.cd.callback,        -- ✅ CD to dir
      },
    })

    -- Global keymap to open Oil from anywhere with Ctrl+o
    vim.keymap.set("n", "<C-o>", "<cmd>Oil<CR>", { noremap = true, silent = true })
  end,
}
