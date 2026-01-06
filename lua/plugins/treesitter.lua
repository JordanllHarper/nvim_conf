return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    build = ':TSUpdate',
    config = function()
      require 'plugins.config.treesitter'
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
  {
    "aaronik/treewalker.nvim",

    opts = {
      highlight = true,
      highlight_duration = 250,
      -- see :h highlight-group for options
      highlight_group = "ColorColumn",
    },
    config = function(_, opts)
      require('treewalker').setup(opts)
      vim.keymap.set('n', '<C-S-j>', '<Cmd>Treewalker SwapDown<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-S-k>', '<Cmd>Treewalker SwapUp<CR>', { noremap = true, silent = true })
    end
  },
}
