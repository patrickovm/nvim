local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", { desc = "Leader" })
vim.g.mapleader = " "

-- Normal mode --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize with up arrow" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize with down arrow" })
keymap(
    "n",
    "<C-Left>",
    ":vertical resize -2<CR>",
    { desc = "Resize with left arrow" }
)
keymap(
    "n",
    "<C-Right>",
    ":vertical resize +2<CR>",
    { desc = "Resize with right arrow" }
)

keymap(
    "n",
    "<leader>bl",
    ":bnext<CR>",
    { desc = "Navigate to next buffer on the right" }
)
keymap(
    "n",
    "<leader>bh",
    ":bprevious<CR>",
    { desc = "Navigate to next buffer on the right" }
)

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

keymap(
    "n",
    "<leader>s",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { desc = "Search and Replace current word" }
)

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Faster Saving" })

-- Insert --
keymap("i", "jk", "<ESC>", { desc = "Press jk fast to enter normal mode" })

-- Visual --
keymap("v", "<", "<gv", { desc = "Stay in indent mode to the left" })
keymap("v", ">", ">gv", { desc = "Stay in indent mode to the right" })

keymap("v", "p", '"_dP', { desc = "Better Paste" })
