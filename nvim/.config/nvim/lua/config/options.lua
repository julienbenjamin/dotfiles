vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'
--vim.opt.tabstop = 4
--im.opt.softtabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.termguicolors = true
vim.opt.showmode = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoread = true
vim.opt.scrolloff = 8
vim.opt.foldlevelstart = 80
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- TODO: move default colorscheme somewhere else
vim.cmd.colorscheme("habamax")
