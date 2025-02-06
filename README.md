
# Neovim Quick Setup

This repository contains a **modular Neovim configuration** using Lazy.nvim as the plugin manager. It includes a structured approach to plugins, keybindings, and UI enhancements for an efficient development workflow.

---

## 📂 **File Structure**
```
~/.config/nvim/
├── init.lua                  # Main entry point for Neovim config
├── lua/
│   ├── plugins/              # Plugin configurations
│   │   ├── init.lua          # Lazy.nvim setup (manages all plugins)
│   │   ├── which-key.lua     # Keybinding manager (starts disabled)
│   │   ├── plugin_keys.lua   # Custom plugin keybindings
│   │   ├── telescope.lua     # Fuzzy finder setup
│   │   ├── lsp.lua           # LSP + Mason configurations
│   │   ├── treesitter.lua    # Treesitter syntax highlighting
│   │   ├── alpha.lua         # Dashboard setup
│   │   ├── oil.lua           # File explorer (Oil.nvim)
│   │   ├── visual_multi.lua  # Multi-cursor support
│   │   ├── mason.lua         # LSP installer manager
│   │   ├── lualine.lua       # Statusline setup
│   ├── vim-options.lua       # General Neovim settings 
│   ├── plugins.lua           # Plugin pointer file
```

---

## 📦 **Installed Plugins**
This setup is **plugin-based**, meaning all configurations are modular and installed through Lazy.nvim.

### 🛠 **Core Plugins**
- **Lazy.nvim** – Plugin manager.
- **Which-Key.nvim** – Keybinding popup (default **OFF**, toggle with `Ctrl + W`).
- **Mason.nvim** – LSP installer.
- **LSPConfig** – Language Server Protocol setup.
- **Treesitter** – Advanced syntax highlighting.

### 🔍 **Navigation & Search**
- **Telescope.nvim** – Fuzzy finder (Find files, live grep, etc.)
- **Oil.nvim** – File explorer (Replaces netrw, mapped to `Ctrl + O`).

### 🎨 **UI Enhancements**
- **Lualine.nvim** – Customizable statusline.
- **Alpha.nvim** – Neovim dashboard (Mapped to `Ctrl + A`).
- **OneDark.nvim** – Default colorscheme.

### 🖥 **Development Enhancements**
- **vim-visual-multi** – Multi-cursor support (`<C-n>` to select next match).
- **Telescope-ui-select.nvim** – Better UI selection for commands.

---

## ⌨ **Keybindings**
This setup includes **custom keybindings**, managed by `which-key.nvim`.

| Key | Action |
|-----|--------|
| `Ctrl + O` | Open Oil.nvim (File Explorer) |
| `Ctrl + P` | Find files (Telescope) |
| `<leader>fg` | Live Grep (Telescope) |
| `<leader>fb` | Find Buffers (Telescope) |
| `<leader>m` | Open Mason (LSP Installer) |
| `<leader>ts` | Update Treesitter Parsers |
| `K` | Hover Info (LSP) |
| `gd` | Go to Definition (LSP) |
| `<leader>rn` | Rename Symbol (LSP) |
| `Ctrl + A` | Open Alpha Dashboard |
| `Ctrl + W` | Toggle Which-Key (ON/OFF) |
| `Ctrl + J` | Add Cursor Below |
| `Ctrl + K` | Add Cursor Above |
| `Ctrl + N` | Select next match (Visual Multi) |

---

## 🛠 **Setup Instructions**
To install this Neovim setup, follow these steps:

1. **Install Neovim (if not installed):**
   ```sh
   sudo apt install neovim   # Ubuntu/Debian
   brew install neovim        # macOS
   winget install neovim      # Windows
   ```

2. **Clone this repository to ~/.config/nvim:**
   ```sh
   git clone https://github.com/your-username/nvim-config.git ~/.config/nvim
   ```

3. **Open Neovim and install plugins:**
   ```sh
   nvim
   :Lazy sync
   ```

4. **Restart Neovim and enjoy!** 🚀

---

## 🛠 **Customization**
- Modify **plugin configurations** inside `lua/plugins/`.
- Add custom **keybindings** to `plugin_keys.lua`.
- Change the **colorscheme** inside `lua/options.lua`.

---

## 🔄 **Troubleshooting**
If something isn't working as expected:

1. **Update all plugins:**
   ```sh
   nvim
   :Lazy update
   ```

2. **Check for errors in logs:**
   ```sh
   :checkhealth
   ```

3. **If which-key.nvim doesn’t show mappings:**
   - Make sure you **toggle it ON** with `Ctrl + W`.
   - Run `:WhichKey` to confirm mappings.

4. **If LSPs don’t work:**
   ```sh
   :LspInfo
   ```
   - Ensure Mason installed the correct LSPs.

5. **Remove broken plugins and reinstall:**
   ```sh
   rm -rf ~/.local/share/nvim/lazy
   nvim
   :Lazy sync
   ```

---

## 🎯 **Why This Setup?**
- **🔥 Fast & Minimal:** Uses Lazy.nvim for optimized performance.
- **🛠 Modular:** Easy to extend and modify.
- **🔄 Pre-configured Plugins:** Includes everything needed for a smooth experience.
- **⌨ Fully Keymapped:** Designed for efficient navigation and coding.

🚀 Enjoy coding with Neovim! Let me know if you need help! 🎯

