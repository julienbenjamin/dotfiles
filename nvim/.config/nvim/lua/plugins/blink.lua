return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  branch = "v1",
  --version = "1*",
  build = "cargo build --release",

  config = function()
    require("blink.cmp").setup({
      keymap = {
        --preset = "enter",
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

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
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
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

      --snippets = {
      --  preset = "luasnip",
      --},

      signature = { enabled = true },
    })
  end,
}
