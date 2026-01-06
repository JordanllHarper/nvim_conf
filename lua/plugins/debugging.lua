return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      require 'plugins.config.dap'
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require 'plugins.config.dapui'
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
}
