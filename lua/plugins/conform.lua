local leaderNmap = require("utils").leader_nmap
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "gofmt" },
			dart = { lsp_format = "fallback" },
			python = { lsp_format = "fallback" },
			swift = { "swift-format", lsp_format = "fallback" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
		leaderNmap("f", require("conform").format, "[f]ormat")
	end,
}
