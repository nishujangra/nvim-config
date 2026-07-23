-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go", "rust", "c", "cpp", "python", "lua", "markdown", "markdown_inline", 
                "sql", "html", "vim", "vimdoc",
            },
            auto_install = true,
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max = 1 * 1024 * 1024 -- 1 MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    return ok and stats and stats.size > max
                end,
            },
            indent = { enable = true },
        })
    end,
}