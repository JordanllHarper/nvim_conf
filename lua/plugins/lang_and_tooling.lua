local leader_nmap_cmd = require("utils").leader_nmap_cmd
return {
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require "plugins.config.flutter-tools"
        end,
    },
    {
        {
            'mrcjkb/rustaceanvim',
            config = function()
                require 'plugins.config.rustaceanvim'
            end,
            lazy = false
        },
        {
            'saecki/crates.nvim',
            event = { "BufRead Cargo.toml" },
            opts = {},
        }
    },

    { 'nanotee/zoxide.vim' },

    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {}
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("toggleterm").setup(opts)
            leader_nmap_cmd("tt", "ToggleTerm direction=horizontal", "[t]oggle [t]erminals")
            leader_nmap_cmd("ta", "ToggleTermToggleAll", "[t]oggle [a]ll terminals")
        end
    },
    {
        "michaelb/sniprun",
        build = "sh install.sh"
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig",         -- optional
        },
        opts = {
            document_color = {
                enabled = false,
            }
        } -- your configuration
    },
    {
        "vinnymeller/swagger-preview.nvim",
        cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
        build = "npm i",
        config = true,
    },
}
