return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      local ls = require 'luasnip'
      local map = require('utils').map

      ls.config.setup {
        setup = {
          enable_autosnippets = true,
        },
      }

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end

      -- jump backwards
      map({ 'n', 'i', 's' }, "<C-h>", function()
        if ls.jumpable(1) then
          ls.jump(-1)
        end
      end)

      -- jump forwards
      map({ 'n', 'i', 's' }, "<C-l>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end)

      -- change forwards
      map({ 'n', 'i', 's' }, "<C-j>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
      -- change backwards
      map({ 'n', 'i', 's' }, "<C-k>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end)
    end
  },
  {
    'saghen/blink.cmp',
    dependencies = "L3MON4D3/LuaSnip",

    version = '*',

    opts = {
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          }
        }
      },
      snippets = {
        preset = 'luasnip',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      keymap = {
        preset = 'default',
        ['<C-a>'] = { 'show' },
        ['<Tab>'] = {},
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true }
    },
  }
}
