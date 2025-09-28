vim.g.mapleader = " "

local keymap = vim.keymap

-- Not needed as we have NvimTree
keymap.set("n", "<leader>mm", vim.cmd.Ex)
keymap.set("n", "<leader>gg", "<cmd>LazyGitCurrentFile<CR>", { noremap = true, silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-y>", "<C-^>")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "@qj")
keymap.set("x", "Q", ":norm @q<CR>")

-- Arrow keys for resizing windows
keymap.set("n", "<Left>", "<cmd>vertical resize -2<CR>")
keymap.set("n", "<Right>", "<cmd>vertical resize +2<CR>")
keymap.set("n", "<Up>", "<cmd>resize -2<CR>")
keymap.set("n", "<Down>", "<cmd>resize +2<CR>")

-- Making splis equal size
keymap.set("n", "<leader>we", "<C-w>=")

-- Closing splits
keymap.set("n", "<leader>wc", "<C-W>c")

-- Control key mappings to create new splits
keymap.set("n", "<C-w>l", "<C-W>v<C-W>l<C-W>L")
keymap.set("n", "<C-w>h", "<C-W>v<C-W>h<C-W>H")
keymap.set("n", "<C-w>j", "<C-W>s<C-W>j<C-W>J")
keymap.set("n", "<C-w>k", "<C-W>s<C-W>k<C-W>K")

-- this remap searches for the word under the cursor and then you can type in words after it.
keymap.set("n", "<leader>i", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>5", "<cmd>w<CR>")

-- Buffer remaps

keymap.set("n", "<leader>dd", "<cmd>bd<CR>")
keymap.set("n", "<leader>DD", "<cmd>bd!<CR>")

keymap.set("n", "<leader>ee", "<cmd> lua vim.diagnostic.open_float() <CR>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

