local M = {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
}

function M.config()
    local navbuddy = require("nvim-navbuddy")
    -- local actions = require("nvim-navbuddy.actions")
    navbuddy.setup({
        window = {
            border = "rounded",
        },
        icons = require("patrick.icons").kind,
        lsp = { auto_attach = true },
    })

    local opts = { noremap = true, silent = true, desc = "Nav" }
    local keymap = vim.api.nvim_set_keymap

    keymap("n", "<leader>o", "<cmd>Navbuddy<cr>", opts)
end

return M
