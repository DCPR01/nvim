--
-- return {
--     {
--         'nvim-telescope/telescope.nvim', tag = '0.1.8',
--         dependencies = { 'nvim-lua/plenary.nvim' },
--         config = function()
--             local telescope = require("telescope")
--             local builtin = require("telescope.builtin")
--             local actions = require("telescope.actions")
--
--             telescope.setup({
--                 defaults = {
--                     layout_strategy = "horizontal",
--                     layout_config = {
--                         width = 0.95,
--                         height = 0.85,
--                         preview_width = 0.5,
--                     },
--                     file_ignore_patterns = { "%.git/", "node_modules/", "%.DS_Store" },
--                     path_display = { "smart" },
--                     prompt_prefix = " ",  -- Ensure prefix is set (required for file count visibility)
--                     selection_caret = "❯ ",
--                     results_title = false,
--                     winblend = 0,
--
--                     -- ✅ Force File Count to Appear
--                     prompt_title = "Find Files",  -- Required to show file count
--                     preview_title = "Preview",  -- Makes the preview title dynamic
--                     dynamic_preview_title = true,
--
--                     -- 🖱 Enable Mouse Scroll & Click
--                     mappings = {
--                         i = {
--                             ["<ScrollWheelUp>"] = actions.move_selection_previous,
--                             ["<ScrollWheelDown>"] = actions.move_selection_next,
--                             ["<LeftMouse>"] = actions.select_default,
--                         },
--                         n = {
--                             ["<ScrollWheelUp>"] = actions.move_selection_previous,
--                             ["<ScrollWheelDown>"] = actions.move_selection_next,
--                             ["<LeftMouse>"] = actions.select_default,
--                         },
--                     },
--                 },
--                 pickers = {
--                     find_files = {
--                         hidden = true,
--                         no_ignore = true,
--                         follow = true,
--                         prompt_title = "Find Files",  -- Ensures file count visibility
--                     },
--                 },
--             })
--
--             -- ✅ Set file count color to match the prompt text color
--             vim.api.nvim_create_autocmd("ColorScheme", {
--                 pattern = "*",
--                 callback = function()
--                     local prompt_color = vim.api.nvim_get_hl_by_name("TelescopePromptNormal", true)
--                     if prompt_color and prompt_color.foreground then
--                         vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = prompt_color.foreground })
--                     end
--                 end,
--             })
--
--             -- Keymaps
--             vim.keymap.set('n', '<C-p>', function()
--                 builtin.find_files({ hidden = true, no_ignore = true })
--             end, {})
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
            local previewers = require("telescope.previewers.utils")

            -- 🖼️ Custom buffer previewer to disable preview for images and other binary files
            local function custom_buffer_previewer_maker(filepath, bufnr, opts)
                local stat = vim.loop.fs_stat(filepath)

                -- Disable preview for images, videos, archives, and large files
                if filepath:match("%.png$") or filepath:match("%.jpg$") or filepath:match("%.jpeg$") or 
                   filepath:match("%.gif$") or filepath:match("%.bmp$") or filepath:match("%.svg$") or
                   filepath:match("%.mp4$") or filepath:match("%.mkv$") or filepath:match("%.avi$") or 
                   filepath:match("%.zip$") or filepath:match("%.tar$") or filepath:match("%.gz$") or
                   (stat and stat.size > 500000)  -- Skip preview for files larger than ~500KB
                then
                    previewers.set_preview_message(bufnr, opts.winid, "Preview Disabled")
                    return
                end

                require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
            end

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.95,
                        height = 0.85,
                        preview_width = 0.5,
                    },
                    file_ignore_patterns = {},  -- 🔹 No files are ignored in the query
                    path_display = { "smart" },
                    prompt_prefix = " ",
                    selection_caret = "❯ ",
                    results_title = false,
                    winblend = 0,

                    -- ✅ Apply the fix to prevent Plenary errors on images
                    buffer_previewer_maker = custom_buffer_previewer_maker,

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
                        prompt_title = "Find Files",
                    },
                },
            })

            -- ✅ Keymaps
            vim.keymap.set('n', '<C-t>', function()
                builtin.find_files({ hidden = true, no_ignore = true })
            end, {})

            -- ✅ Add Keybinding to Open Lazy.nvim
            vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Open Lazy.nvim" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    }
}
