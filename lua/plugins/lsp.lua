-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev


-- LSP = Language server protocol

-- Neovim  ──(LSP, a JSON protocol)──►  rust-analyzer / gopls / clangd
--         ◄─────────────────────────
--         "what's the type here?" → "this is a String, here's its definition"

return {
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer", "gopls", "clangd",
                "lua_ls", "pyright", "ts_ls",
            },
        })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local caps = vim.lsp.protocol.make_client_capabilities()
            local ok, blink = pcall(require, "blink.cmp")
            if ok then caps = blink.get_lsp_capabilities(caps) end

            local servers = {
                gopls = {
                    settings = { gopls = {
                        analyses = { unusedparams = true, shadow = true },
                        staticcheck = true, gofumpt = true,
                    } },
                },
                clangd = {
                cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
                },
                lua_ls = {
                    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
                },
                pyright = {},
                ts_ls = {},
                -- rust_analyzer intentionally omitted: handled by rustaceanvim (Phase G)
            }
          
            -- Neovim 0.11+ API: register config, then enable the server.
            vim.lsp.config("*", { capabilities = caps })
            for name, opts in pairs(servers) do
                opts.capabilities = caps
                vim.lsp.config(name, opts)
                vim.lsp.enable(name)
            end

            -- buffer-local keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local b = { buffer = ev.buf }
                    local map = vim.keymap.set
                    map("n", "gd", vim.lsp.buf.definition, b)
                    map("n", "gr", vim.lsp.buf.references, b)
                    map("n", "gi", vim.lsp.buf.implementation, b)
                    map("n", "K", vim.lsp.buf.hover, b)
                    map("n", "<leader>rn", vim.lsp.buf.rename, b)
                    map("n", "<leader>ca", vim.lsp.buf.code_action, b)
                    map("n", "[d", vim.diagnostic.goto_prev, b)
                    map("n", "]d", vim.diagnostic.goto_next, b)
                    map("n", "<leader>e", vim.diagnostic.open_float, b)
                end,
            })
        end,
    },
}