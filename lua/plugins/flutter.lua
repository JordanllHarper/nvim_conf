return {
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local flutter_tools = require 'flutter-tools'
        local cmd = require "flutter-tools.commands"
        local log = require 'flutter-tools.log'
        local lsp = require 'flutter-tools.lsp'
        local telescope = require 'telescope'
        local batchMap = require 'utils'.batch_map

        local mappings = {
            { "Frl", cmd.reload,                  "[F]lutter [r]e[l]oad" },
            { "Frs", cmd.restart,                 "[F]lutter [r]e[s]tart" },
            { "Fs",  cmd.run,                     "[F]lutter [s]tart (run)," },
            { "Fq",  cmd.quit,                    "[F]lutter [q]uit" },
            { "Fe",  "<Cmd>FlutterEmulators<CR>", "[F]lutter [e]mulators" },
            { "Fc",  log.clear,                   "[F]lutter [c]lear" },
            { "Fl",  log.toggle,                  "[F]lutter [l]og (toggle)," },
            { "FL",  lsp.restart,                 "[F]lutter [L]sp Restart" },
        }

        local opts = {
            settings = {
                renameFilesWithClasses = "always",
            },
            fvm = true,
            lsp = {
                on_attach = require("lsp").on_attach,
                color = {
                    enabled = true,
                },
            },
            widget_guides = {
                enabled = true,
            },
        }

        batchMap(mappings, require 'utils'.leader_nmap)
        flutter_tools.setup(opts)
        telescope.load_extension("flutter")
    end,
}
