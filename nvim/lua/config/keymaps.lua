-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("v", "p", '"0p')
keymap.set("n", "c", '"_c')
keymap.set("v", "c", '"_c')
keymap.set("n", "d", '"_d')
keymap.set("v", "d", '"_d')

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all / move line
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<C-j>", "<Cmd>m +1<CR>")
keymap.set("n", "<C-k>", "<Cmd>m -2<CR>")

-- exit with jk
-- keymap.set("i", "jk", "<Esc>")

-- C++ build
--
-- keymap.set(
--   "n",
--   "<C-b>",
--   ":w<CR>:!g++ -std=c++17 % -o ~/Documents/Contest/.build/run && timeout 4s ~/Documents/Contest/.build/run<~/Documents/Contest/.build/test.in>~/Documents/Contest/.build/test.out<CR>"
-- )
--
keymap.set(
  "n",
  "<C-p>",
  "<Cmd>w<CR><Cmd>!g++ -std=c++17 % -o ~/Documents/Contest/.build/run && timeout 4s ~/Documents/Contest/.build/run<~/Documents/Contest/.build/test.in<CR>"
)

-- bufferline
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>") -- Next tab
