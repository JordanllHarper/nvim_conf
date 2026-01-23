local utils = require 'utils'

utils.leader_nmap_cmd(
    "Rt",
    "lua Toggle_2(\"dotnet test\")",
    "dotnet [R]un [t]est"
)
