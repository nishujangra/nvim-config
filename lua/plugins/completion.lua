-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev

return {
    "saghen/blink.cmp",
    version = "*",              -- uses prebuilt fuzzy matcher
    opts = {
        keymap = { preset = "default" },   -- <C-y> to accept, <C-n>/<C-p> to cycle
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        completion = {
            documentation = { auto_show = true },
        },
    },
}