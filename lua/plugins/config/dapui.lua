local map = require 'utils'
local dapui = require 'dapui'
local opts = {}

dapui.setup(opts)

map.leader_nmap("Dv", dapui.toggle, "Toggle [V]iew")
