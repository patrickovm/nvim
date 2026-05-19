if vim.g.vscode then
    vim.opt.clipboard = "unnamedplus"
else
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    require("config")
    require("plugins")
end
