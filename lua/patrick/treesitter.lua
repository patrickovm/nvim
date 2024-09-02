local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
}

function M.config()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        ignore_install = { "d" },
        highlight = {
            enable = true,
        },
    })
end

return M
