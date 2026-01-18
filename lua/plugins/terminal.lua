local leader_nmap_cmd = require("utils").leader_nmap_cmd
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function(_, opts)
    require("toggleterm").setup(opts)
    leader_nmap_cmd("tt", "ToggleTerm direction=horizontal", "[t]oggle [t]erminals")
    leader_nmap_cmd("ta", "ToggleTermToggleAll", "[t]oggle [a]ll terminals")
  end
}
