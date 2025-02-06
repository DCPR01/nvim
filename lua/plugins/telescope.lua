-- return {
--     {
--         'nvim-telescope/telescope.nvim', tag = '0.1.8',
--         dependencies = { 'nvim-lua/plenary.nvim' },
--         config = function()
--             local builtin = require("telescope.builtin")
--             vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--         end
--     },
--     {
--         "nvim-telescope/telescope-ui-select.nvim"
--     }
-- }
return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.95,
                        height = 0.85,
                        preview_width = 0.5,
                    },
                    file_ignore_patterns = { "%.git/", "node_modules/", "%.DS_Store" },
                    path_display = { "smart" },
                    prompt_prefix = " ",  -- Ensure prefix is set (required for file count visibility)
                    selection_caret = "❯ ",
                    results_title = false,
                    winblend = 0,

                    -- ✅ Force File Count to Appear
                    prompt_title = "Find Files",  -- Required to show file count
                    preview_title = "Preview",  -- Makes the preview title dynamic
                    dynamic_preview_title = true,

                    -- 🖱 Enable Mouse Scroll & Click
                    mappings = {
                        i = {
                            ["<ScrollWheelUp>"] = actions.move_selection_previous,
                            ["<ScrollWheelDown>"] = actions.move_selection_next,
                            ["<LeftMouse>"] = actions.select_default,
                        },
                        n = {
                            ["<ScrollWheelUp>"] = actions.move_selection_previous,
                            ["<ScrollWheelDown>"] = actions.move_selection_next,
                            ["<LeftMouse>"] = actions.select_default,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                        follow = true,
                        prompt_title = "Find Files",  -- Ensures file count visibility
                    },
                },
            })

            -- ✅ Set file count color to match the prompt text color
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    local prompt_color = vim.api.nvim_get_hl_by_name("TelescopePromptNormal", true)
                    if prompt_color and prompt_color.foreground then
                        vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = prompt_color.foreground })
                    end
                end,
            })

            -- Keymaps
            vim.keymap.set('n', '<C-p>', function()
                builtin.find_files({ hidden = true, no_ignore = true })
            end, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    }
}
