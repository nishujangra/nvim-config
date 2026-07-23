-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev


return {
    { 
        "folke/which-key.nvim", 
        event = "VeryLazy", 
        opts = {} 
    },
    { 
        "lewis6991/gitsigns.nvim", 
        event = { "BufReadPre", "BufNewFile" },
        config = function() require("gitsigns").setup() end 
    },
    { 
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("lualine").setup({ options = { theme = "rose-pine" } }) end 
    },
    { 
        "folke/trouble.nvim", 
        cmd = "Trouble", 
        opts = {} 
    },
    { 
        "windwp/nvim-autopairs", 
        event = "InsertEnter", 
        opts = {} 
    },
    { 
        "windwp/nvim-ts-autotag", 
        ft = { "html", "jsx", "tsx" }, 
        opts = {} 
    },
}