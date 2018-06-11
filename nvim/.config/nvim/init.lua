package.path = vim.fn.stdpath("config") .. "/lua/?.lua;" .. package.path

require('config.options')
require('config.lazy')
require('config.autocmds')
require('config.keymaps')
require('config.lsp')

