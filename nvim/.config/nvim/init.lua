package.path = vim.fn.stdpath("config") .. "/lua/?.lua;" .. package.path

require('config.lazy')
require('config.autocmds')
require('config.keymaps')
require('config.lsp')
require('config.options')
--require('plugins.blink')
--require('plugins.colorscheme')
--require('plugins.lsp')
--require('plugins.mason')
