local M = {
    "utilyre/barbecue.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
}

function M.config()
    local barbecue = require("barbecue")
    barbecue.setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
        attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
        theme = {
            normal = { bg = "#282A36" },
        },
    })

    vim.api.nvim_create_autocmd({
        "WinScrolled",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include these if you have set `show_modified` to `true`
        "BufWritePost",
        "TextChanged",
        "TextChangedI",
    }, {
        group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
        callback = function()
            require("barbecue.ui").update()
        end,
    })
end

return M
