local M = {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
}

function M.config()
    local conform = require("conform")

    conform.setup({
        formatters_by_ft = {
            json = { "jq" },
            yaml = { "yamlfmt" },
            markdown = { "markdownlint" },
            lua = { "stylua" },
            python = { "black" },
            c = { "clang-format" },
            go = { "goimports", "gofmt" },
            rust = { "rustfmt", lsp_format = "fallback" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        })
    end, { desc = "Format file or range (in visual mode)" })
end

return M
