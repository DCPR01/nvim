
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard") -- Ensure this loads correctly

    -- Header Logo
    local logo = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                    ]],
    }

    -- Set Header
    dashboard.section.header.val = logo

    -- Buttons for Alpha Dashboard
    dashboard.section.buttons.val = {
        dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"), --":Telescope find_files<CR>:AlphaClose<CR>"
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
        dashboard.button("l", "󰒲  Lazy.nvim", ":Lazy<CR>"), -- ✅ New Lazy.nvim button
        dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer
    local function footer()
        local lazy = require("lazy")
        local plugins_count = lazy.stats().count -- Count loaded plugins
        local version = vim.version()
        local date = os.date("%m-%d-%Y")
        return string.format("  %d plugins loaded |   Neovim v%s.%s.%s |   %s", plugins_count, version.major, version.minor, version.patch, date)
    end
    dashboard.section.footer.val = footer()

    -- Highlight groups
    dashboard.section.header.opts.hl = "Function"
    dashboard.section.buttons.opts.hl = "Identifier"
    dashboard.section.footer.opts.hl = "Comment"

    -- Apply Alpha setup
    alpha.setup(dashboard.opts)

    -- Close Alpha buffer after Telescope actions
    vim.cmd([[
      autocmd User AlphaReady setlocal nofoldenable
      command! AlphaClose lua require("alpha").start(false)
    ]])
  end,
}
