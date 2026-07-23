-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev


return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,   -- it self-registers on Rust files
        init = function()
        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                    },
                },
            },
        }
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function() require("crates").setup() end,
    },
}