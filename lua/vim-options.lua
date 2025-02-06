-- vim.cmd("set number")
-- vim.cmd("set mouse=a")
-- vim.cmd("syntax enable")
-- vim.cmd("set showcmd")
-- vim.cmd("set encoding=utf-8")
-- vim.cmd("set showmatch")
-- vim.cmd("set relativenumber")
-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set shiftwidth=0")
-- vim.cmd("set softtabstop=0")
-- vim.cmd("set autoindent")
-- vim.cmd("set smarttab")
-- vim.keymap.set('n', '<C-h>', '<C-w>h', {})
-- vim.keymap.set('n', '<C-l>', '<C-w>l',{})

-- ✅ Cleaner Neovim Settings
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative numbers
vim.opt.mouse = "a"             -- Enable mouse support
vim.opt.syntax = "enable"       -- Enable syntax highlighting
vim.opt.showcmd = true          -- Show command in bottom bar
vim.opt.encoding = "utf-8"      -- Set encoding
vim.opt.showmatch = true        -- Highlight matching brackets
vim.opt.expandtab = true        -- Convert tabs to spaces
vim.opt.tabstop = 4             -- Tab width = 4 spaces
vim.opt.shiftwidth = 4          -- Indent width = 4 spaces
vim.opt.softtabstop = 4         -- Soft tab size = 4 spaces
vim.opt.autoindent = true       -- Enable auto-indentation
vim.opt.smarttab = true         -- Enable smart tab behavior

-- ✅ Keybindings for Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- Move left
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- Move right

-- ✅ Keybinding to Open Alpha Dashboard
vim.keymap.set('n', '<C-a>', ':Alpha<CR>', { noremap = true, silent = true }) -- Open Alpha