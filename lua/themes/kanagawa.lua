-- something
return {
    "rebelot/kanagawa.nvim",
    opts = {
        overrides = function(colors)
            return {
                Keyword = { italic = false }
            }
        end
    },
    theme = "dragon",
    priority = 1000,
}
