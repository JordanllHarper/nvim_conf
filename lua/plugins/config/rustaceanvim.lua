local utils = require 'utils'
local leaderNmap = utils.leader_nmap
local batchMap = utils.batch_map


vim.g.rustaceanvim = {
  server = {
    on_attach = require('lsp-attach'),
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
