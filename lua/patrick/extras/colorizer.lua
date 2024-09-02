local M = {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
}

function M.config()
    require("colorizer").setup({
        filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
            "css",
            "html",
            "astro",
            "lua",
        },
        user_default_options = {
            names = false,
            rgb_fn = true,
            hsl_fn = true,
            tailwind = "both",
        },
        buftypes = {},
    })
end

vim.keymap.set(
    "n",
    "<leader>ct",
    "<cmd>ColorizerToggle<CR>",
    { desc = "Toggles Colorizer" }
)

return M
