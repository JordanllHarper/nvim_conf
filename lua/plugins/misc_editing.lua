return {
	{
		"numToStr/Comment.nvim",
		opts = {
			opleader = {
				line = "<leader>z",
				block = "<leader>b",
			},
			toggler = {
				line = "<leader>zz",
				block = "<leader>bb",
			},
		},
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {}
	},
	{
		'tpope/vim-sleuth',
	}
}
