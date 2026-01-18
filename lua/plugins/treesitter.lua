return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = "main",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      -- put your config here
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require 'plugins.config.treesitter'
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
}
