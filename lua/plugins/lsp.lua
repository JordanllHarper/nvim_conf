local leader_nmap_cmd = require('utils').leader_nmap_cmd
return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      require 'plugins.config.lsp'
    end,
  },
}
