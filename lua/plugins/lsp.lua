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
