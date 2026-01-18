return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>D",  group = "[D]ebug" },
      { "<leader>Ds", group = "[s]tep..." },
      { "<leader>g",  group = "[g]it..." },
      { "<leader>g",  group = "[g]it" },
      { "<leader>l",  group = "[l]azy" },
      { "<leader>L",  group = "[L]sp" },
      { "<leader>n",  group = "[N]eotest" },
      { "<leader>O",  group = "[O]il" },
      { "<leader>q",  group = "[q]uickfix" },
      { "<leader>r",  group = "[r]ename" },
      { "<leader>R",  group = "[R]ust" },
      { "<leader>s",  group = "[s]earch" },
      { "<leader>w",  group = "[w]orkspace" },
    },
  },
}
