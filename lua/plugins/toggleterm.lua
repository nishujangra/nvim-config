-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev


return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-\>]], -- press Ctrl+\ to toggle
            direction = "float",      -- or "horizontal", "vertical"
            persist_size = true,
        })
    end,
}
