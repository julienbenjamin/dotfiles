local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- colorschemes
  {
    "tanvirtin/monokai.nvim",
  },

  {
    "folke/tokyonight.nvim",
  },

  -- completion
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1*",
    build = 'cargo build --release',

    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "enter",
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },
          ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust" },

        completion = {
          keyword = { range = "prefix" },
          menu = {
            draw = {
              treesitter = { "lsp" },
            },
          },
          trigger = { show_on_trigger_character = true },
          documentation = {
            auto_show = true,
          },
        },

        signature = { enabled = true },
      })
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "clangd",
          "bashls",
          "marksman",
        },
      })
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp").setup()
    end,
  },

})
