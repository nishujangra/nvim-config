-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
            go = { "goimports", "gofmt" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            lua = { "stylua" },
            python = { "black" },
        },
        format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
    },
}