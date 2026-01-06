local nmap = require("utils").nmap
local leaderNmap = require("utils").leader_nmap
local leaderNmapCmd = require("utils").leader_nmap_cmd
return {
	{
		"tpope/vim-fugitive",
		config = function()
			leaderNmapCmd("gc", "Git commit", "[g]it [C]ommit")
			leaderNmapCmd("G", "Git", "[G]it")
			leaderNmapCmd("gp", "Git push", "[g]it [p]ush")
			leaderNmapCmd("ga", "Git add %", "[g]it [a]dd")
			leaderNmapCmd("gA", "Git add .", "[g]it [A]dd (all)")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function()
				local gs = require("gitsigns")
				leaderNmap("gh", gs.preview_hunk, "[g]it [h]unk")
				leaderNmap("gs", gs.stage_hunk, "[g]it [s]tage hunk")
				leaderNmap("gr", gs.reset_hunk, "[g]it [r]eset hunk")
				leaderNmap("gS", gs.stage_buffer, "[g]it [S]tage buffer")

				nmap("[h", function()
					gs.nav_hunk('prev')
				end, "Next [h]unk")
				nmap("]h", function()
					gs.nav_hunk('next')
				end, "Next [h]unk")
			end,
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require 'utils'.leader_nmap('lg', require('lazygit').lazygit, '[L]azy[G]it')
		end
	}
}
