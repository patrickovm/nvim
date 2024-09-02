local M = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers = {
        "lua_ls",
        "gopls",
        "bufls",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "cmake",
        "rust_analyzer",
        "clangd",
        "pyright",
        "bashls",
        "jsonls",
        "hyprls",
        "marksman",
        "texlab",
    }

    require("mason").setup({
        ui = {
            border = "rounded",
        },
    })

    require("mason-lspconfig").setup({
        ensure_installed = servers,
    })
end

return M
