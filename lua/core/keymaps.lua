local keymap = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}
local terminal_opts = {silent = true}

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- INSERT --

-- Undo break points
keymap("i", ".", ".<C-g>u", opts)
keymap("i", " ", " <C-g>u", opts)
keymap("i", ",", ",<C-g>u", opts)

-- NORMAL --

-- Move lines up and down
keymap("n", "<A-j>", "<CMD>m .+1<CR>==", opts)
keymap("n", "<A-k>", "<CMD>m .-2<CR>==", opts)

-- Split navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Buffer navigations
keymap("n", "<Tab>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-Tab>", "<CMD>bprevious<CR>", opts)

-- Resizing splits
keymap("n", "<C-Up>", "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)

-- Next/Previous find
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- VISUAL --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- TERMINAL --

-- Exiting
keymap("t", "<Esc>", "<C-\\><C-n>", terminal_opts)

-- Better Navigations
keymap("t", "<C-j>", "<C-\\><C-j>", terminal_opts)
keymap("t", "<C-k>", "<C-\\><C-k>", terminal_opts)
keymap("t", "<C-l>", "<C-\\><C-l>", terminal_opts)
keymap("t", "<C-h>", "<C-\\><C-h>", terminal_opts)
