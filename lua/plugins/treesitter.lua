return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
        },
        build = ':TSUpdate',
        lazy = false,
        config = function(_, opts)
            require 'nvim-treesitter.configs'.setup {
                sync_install          = true,
                ignore_install        = { 'dart' },
                ensure_installed      = {
                    'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash'
                },
                highlight             = { enable = true },
                indent                = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<space>.',
                        node_incremental = '<space>.',
                        scope_incremental = '<space>;.',
                        node_decremental = '<space>,',
                    },
                },
            }
        end,
    },
    {
        dependencies = { 'nvim-treesitter' },
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                    },
                    swap = {
                        enable = true,
                    },
                },
            }
            local set_select = function(movement, to)
                local select = require "nvim-treesitter-textobjects.select"
                vim.keymap.set({ "x", "o" }, movement, function()
                    select.select_textobject(to, "textobjects")
                end)
            end

            set_select("af", "@function.outer")
            set_select("if", "@function.inner")
            set_select("ac", "@class.outer")
            set_select("ic", "@class.outer")
            set_select("aa", "@parameter.outer")
            set_select("ia", "@parameter.inner")

            local set_move_next_start = function(movement, to)
                local move = require 'nvim-treesitter-textobjects.move'
                vim.keymap.set("n", movement,
                    function()
                        move.goto_next_start(to, "textobjects")
                    end)
            end
            set_move_next_start("]m", "@function.outer")
            set_move_next_start("]]", "@class.outer")

            local set_move_next_end = function(movement, to)
                local move = require 'nvim-treesitter-textobjects.move'
                vim.keymap.set("n", movement,
                    function()
                        move.goto_next_end(to, "textobjects")
                    end)
            end

            set_move_next_end("]M", "@function.outer")
            set_move_next_end("][", "@class.outer")

            local set_move_prev_start = function(movement, to)
                local move = require 'nvim-treesitter-textobjects.move'
                vim.keymap.set("n", movement,
                    function()
                        move.goto_previous_start(to, "textobjects")
                    end)
            end

            set_move_prev_start("[m", "@function.outer")
            set_move_prev_start("[[", "@class.outer")

            local set_move_prev_end = function(movement, to)
                local move = require 'nvim-treesitter-textobjects.move'
                vim.keymap.set("n", movement,
                    function()
                        move.goto_previous_end(to, "textobjects")
                    end)
            end

            set_move_prev_end("[M", "@function.outer")
            set_move_prev_end("[]", "@class.outer")

            local swap = require 'nvim-treesitter-textobjects.swap'
            vim.keymap.set("n", "<leader>a",
                function()
                    swap.swap_next("@parameter.inner", "textobjects")
                end,
                { desc = "Swap next [a]rgument" }
            )

            vim.keymap.set("n", "<leader>A",
                function()
                    swap.swap_previous("@parameter.inner", "textobjects")
                end,
                { desc = "Swap prev [A]rgument" }
            )
        end
    },
}
