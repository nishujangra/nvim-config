-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev

return {
    "saghen/blink.cmp",
    build = "cargo build --release",   -- build fuzzy matcher from source (needs cargo)
    opts = {
        keymap = { preset = "default" },   -- <C-y> to accept, <C-n>/<C-p> to cycle
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        completion = {
            documentation = { auto_show = true },
        },
    },
}