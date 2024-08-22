vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})
-- keymap.set({ "n", "i" }, "<C-Enter>", "<Esc>o")
-- keymap.set({ "n", "i" }, "<C-Shift-Enter>", "<Esc>O")

keymap.set("n", "<C-b>", ":w<CR>:!g++ -std=c++17 % -o ~/Documents/Contest/.build/run && timeout 4s ~/Documents/Contest/.build/run<~/Documents/Contest/.build/test.in>~/Documents/Contest/.build/test.out<CR>")
keymap.set("n", "<C-p>", ":w<CR>:!g++ -std=c++17 % -o ~/Documents/Contest/.build/run && timeout 4s ~/Documents/Contest/.build/run<~/Documents/Contest/.build/test.in<CR>")

-- Clear highlights on search when pressing <Esc>/<leader>nh in normal mode
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", {desc = "Clear search highlights"})
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "Clear search highlights"})

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", {desc = "Increment number"}) -- increment
keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement number"}) -- decrement

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to swich between windows
--
-- See  `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
-- Try it with `yay` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
   desc = 'Highlight when yanking (copying) text',
   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
   callback = function()
      vim.highlight.on_yank()
   end,
})

-- window management
keymap.set("n", "<C-A-v>", "<C-w>v", {desc = "Split window vertically"}) -- split window vertically
keymap.set("n", "<C-A-h>", "<C-w>s", {desc = "Split window horizontally"}) -- split window horizontally
keymap.set("n", "<C-A-e>", "<C-w>=", {desc = "Make splits equal size"}) -- make split windows equal width & height
keymap.set("n", "<C-A-w>", "<cmd>close<CR>", {desc = "Close current split"}) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"}) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"}) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open current buffer in new tab"}) --  move current buffer to new tab
