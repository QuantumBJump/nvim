-- Easier to jump when I know line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- 4-space tab is better than 8 but still disincentivises unnecessary nesting
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

-- I want undo files instead of backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlight while I'm searching, but not after
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Nice scrolling
vim.opt.scrolloff = 8
-- Nice colours
vim.opt.termguicolors = true
-- Fast update
vim.opt.updatetime = 50

-- Show a line to stop me writing too long lines
vim.opt.colorcolumn = "120"
vim.opt.signcolumn = "auto"
vim.opt.textwidth = 0

-- I want to split to the right by default
vim.opt.splitright = true
