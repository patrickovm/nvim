return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"), -- helps LuaLS resolve requires
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- "" gets ALL runtime files, not just lua/
                checkThirdParty = false,
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
            diagnostics = {
                globals = { "vim" },
                unusedLocalExclude = { "_*" }, -- ignore intentionally unused _vars
            },
            completion = {
                callSnippet = "Replace", -- shows full signature snippet on complete
            },
            hint = {
                enable = true, -- inlay hints
                setType = true, -- show type on assignments
                paramName = "Disable", -- param name hints get noisy in Lua
                arrayIndex = "Disable", -- same
            },
            telemetry = { enable = false },
        },
    },
}
