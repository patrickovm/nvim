local keymap = vim.keymap.set
local opts = { silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal mode --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Search and replace current word
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

-- Faster saving
keymap("n", "<leader>w", "<cmd>w<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
keymap("i", "jk", "<ESC>", { desc = "Press jk fast to enter normal mode" })

-- Visual --
--
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggles NvimTree" })

-- Git Blame
keymap("n", "<leader>gb", "<cmd>GitBlameToggle<CR>", { desc = "Toggles GitBlame" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "[F]ind [F]iles" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "[F]ind by [G]rep" })
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "[F]ind [P]rojects" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "[F]ind existing [B]uffers" })
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "[F]ind [K]eymaps" })

-- Colorizer
keymap("n", "<leader>ct", "<cmd>ColorizerToggle<CR>", { desc = "Toggles Colorizer" })
