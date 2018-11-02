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

local lspconfig = require("lspconfig")

function lsp.setup()
    -- C/C++
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Python
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Rust
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Lua
    lspconfig.lua_ls.setup({
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
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- Markdown
    lspconfig.marksman.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return lsp
