return {
  {
    'mrcjkb/rustaceanvim',
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = require('lsp').on_attach,
          default_settings = {
            ['rust-analyzer'] = {
              diagnostics = {
                styleLints = true
              },
              inlayHints = {
                closureCaptureHints = true,
                implicitDrops = true,
              },
              completion = {
                privateEditable = true,
              }
            }
          }
        },
      }
    end,
    lazy = false
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    opts = {},
  }
}
