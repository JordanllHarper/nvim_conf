local leader_nmap_cmd = require("utils").leader_nmap_cmd

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    config = function(_, opts)
        local tt = require 'toggleterm'
        tt.setup(opts)

        function Make_powershell()
            local terminal = require 'toggleterm.terminal'.Terminal:new
                {
                    cmd = "powershell"
                }
            return terminal
        end

        Term1 = Make_powershell()
        Term2 = Make_powershell()

        function Toggle_Term_With_Command(term, cmd)
            if cmd then
                if not term:is_open() then
                    term:open()
                end
                term:send(cmd)
            else
                term:toggle()
            end
        end

        function Toggle_1(cmd)
            Toggle_Term_With_Command(Term1, cmd)
        end

        function Toggle_2(cmd)
            Toggle_Term_With_Command(Term2, cmd)
        end

        leader_nmap_cmd("tt", "lua Toggle_1()", "[t]oggle [t]terminal 1")
        leader_nmap_cmd("t2", "lua Toggle_2()", "[t]oggle [2]nd terminal")
        leader_nmap_cmd("ta", "ToggleTermToggleAll", "[t]oggle [a]ll terminals")
    end
}
