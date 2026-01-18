return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',

  opts         = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    extensions = { 'fugitive' },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(displayed_mode)
            return displayed_mode:sub(1, 1)
          end,
        },
      },
      lualine_b = {
        {
          'filename',
          path = 1,
          symbols = {
            modified = "[#]",
          },
        },
        { 'diff' },
      },
      lualine_c = {},
      lualine_x = {
        {
          'diagnostics',
          sources = {
            'nvim_workspace_diagnostic',
          },
        },
      },
      lualine_y = {
        { 'branch', },
        { 'searchcount', },
      },
      lualine_z = { { 'location', },
        { 'progress' },
        { 'datetime', style = "%H:%M" },
        {
          function()
            return vim.fn.wordcount().words
          end,
        },
      },
    },
  },
}
