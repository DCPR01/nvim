return {
    {
        "folke/which-key.nvim",
        config = function()
            local which_key = require("which-key")
            which_key.setup({}) -- Default setup

            -- ✅ Function to Toggle Which-Key
            local which_key_enabled = true
            function ToggleWhichKey()
                if which_key_enabled then
                    which_key.setup({ plugins = { marks = false, registers = false } }) -- Disable Which-Key
                    print("🔴 Which-Key Disabled")
                else
                    which_key.setup({}) -- Enable Which-Key
                    print("🟢 Which-Key Enabled")
                end
                which_key_enabled = not which_key_enabled
            end

            -- ✅ Keybinding to Toggle Which-Key (Ctrl + W)
            vim.api.nvim_set_keymap("n", "<C-w>", ":lua ToggleWhichKey()<CR>", { noremap = true, silent = true })
        end
    }
}
