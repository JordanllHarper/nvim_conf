vim.diagnostic.config({
    severity_sort = true,
})

vim.lsp.config('*', {
    capabilities = require("blink-cmp").get_lsp_capabilities()
})
vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

---@type table<string | table<string, vim.lsp.Config>>
local global_servers = {
    {
        "csharp_ls",
        {
            settings = {
                csharp = {
                    applyFormattingOptions = true
                }
            }
        }
    },
    {
        "bicep",
        {
            cmd = { "dotnet", "C:/tools/bicep-langserver/Bicep.LangServer.dll" }
        }
    },
    "lemminx",
    "lua_ls",
    "bashls",
    "gopls",
    "ruby_lsp",
    "pyright",
    "ocamllsp",
    "rust-analyzer",
    "ts_ls",
    "phpactor",
    "svelte",
    {
        "clangd",
        ---@type vim.lsp.Config
        {
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
                "--background-index",
                "--clang-tidy",
                "--log=verbose",
            },
        }
    }
}

for _, server in ipairs(global_servers) do
    local serverName = server
    if type(server) == "table" then
        serverName = server[1]
        local configuration = server[2]
        vim.lsp.config[serverName] = configuration
    end

    vim.lsp.enable(serverName)
end
