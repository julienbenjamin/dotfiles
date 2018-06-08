local lsp = {}

local capabilities = require("blink.cmp").get_lsp_capabilities()

local function on_attach(_, bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- Info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Refactor
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

    -- Formatting
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

function lsp.setup()
  -- C/C++
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Python
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Rust
  vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Lua
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  })

  -- Bash
  vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Markdown
  vim.lsp.config("marksman", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- ENABLE servers (this is REQUIRED)
  vim.lsp.enable({
    "clangd",
    "pyright",
    "rust_analyzer",
    "lua_ls",
    "bashls",
    "marksman",
  })
end

return lsp
