return {
	{
		"stevearc/dressing.nvim",
		enabled = true,
		opts = {
			input = {
				enabled = false,
			},
		},
	},
	{
		'goolord/alpha-nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('alpha').setup(require 'alpha.themes.startify'.config)
		end
	},
}
