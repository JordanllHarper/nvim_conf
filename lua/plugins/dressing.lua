return {
    'stevearc/dressing.nvim',
    opts = {
        input = {
            enabled = false,
        },
        select = {
            telescope = require('telescope.themes').get_dropdown {}
        }
    }
}
