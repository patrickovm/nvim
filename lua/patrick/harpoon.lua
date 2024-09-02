local M = {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
}

function M.config()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap(
        "n",
        "<s-m>",
        "<cmd>lua require('patrick.harpoon').mark_file()<cr>",
        { desc = "Mark file in harpoon" }
    )
    keymap(
        "n",
        "<TAB>",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        { desc = "Toggle harpoon quick menu" }
    )
end

function M.mark_file()
    require("harpoon.mark").add_file()
    vim.notify("󱡅  marked file")
end

return M
