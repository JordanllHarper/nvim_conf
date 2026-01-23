return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            { "<leader>g", group = "[g]it..." },
            { "<leader>l", group = "[l]azy" },
            { "<leader>L", group = "[L]sp" },
            { "<leader>n", group = "[N]eotest" },
            { "<leader>O", group = "[O]il" },
            { "<leader>q", group = "[q]uickfix.." },
            { "<leader>r", group = "[r]ename" },
            { "<leader>s", group = "[s]earch" },
            { "<leader>w", group = "[w]orkspace" },
        },
    },
}
