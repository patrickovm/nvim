local M = {
    "nvim-lualine/lualine.nvim",
}

local location = {
    padding = 1,
    "location",
}

local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local progress = {
    "progress",
    fmt = function()
        return "%P/%L"
    end,
}

function M.config()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = { "alpha", "dashboard", "nvimtree" },
                winbar = { "alpha", "dashboard", "nvimtree" },
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { spaces, "encoding", "fileformat", "filetype" },
            lualine_y = { location },
            lualine_z = { progress },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    })
end

return M
