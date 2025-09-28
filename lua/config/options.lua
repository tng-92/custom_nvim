local opt = vim.opt -- for conciseness

opt.mouse = ""

opt.nu = true
opt.relativenumber = true

opt.title = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.backspace = { "indent", "eol", "start" }

opt.smartindent = true
opt.autoindent = true

opt.wrap = true
opt.breakindent = true
opt.linebreak = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

opt.cmdheight = 0
opt.laststatus = 0
