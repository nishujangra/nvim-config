-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev


return {
    -- Claude Code in a managed floating terminal
    {
        "greggh/claude-code.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "ClaudeCode",
        keys = {
            { "<leader>cc", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude Code" },
        },
        config = function()
            require("claude-code").setup({
            window = { position = "float" },
        })
        end,
    },

    -- snacks float for the Codex CLI (and raw Claude CLI if you want it)
    {
        "folke/snacks.nvim",
        opts = { terminal = {} },
        keys = {
            { "<leader>co", function() require("snacks").terminal.toggle("codex") end,
                desc = "Toggle Codex CLI" },
            { "<leader>ct", function() require("snacks").terminal.toggle("claude") end,
                desc = "Toggle Claude (raw CLI)" },
        },
    },

    --   OPTIONAL: as-you-type ghost text. Uncomment to enable.
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     config = function() require("supermaven-nvim").setup({}) end,
    -- },
}