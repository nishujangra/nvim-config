-- Written by Nishant ndjangra1027@gmail.com nishujangra.dev

return {
	{
    	"rose-pine/neovim",
    	name = "rose-pine",
    	priority = 1000,
    	config = function()
      		vim.cmd.colorscheme("rose-pine")
      		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    	end,
  	},
  	{ "mbbill/undotree", cmd = "UndotreeToggle" },
  	{ "tpope/vim-fugitive", cmd = "Git" },
  	{ "theprimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
}