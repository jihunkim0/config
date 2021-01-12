local map = require("utils").map

-- Better indenting
--map("v", "<", "<gv", {})
--map("v", ">", ">gv", {})

-- clear all the highlighted text from the previous search
--map("n", "<Leader><Space>", ":noh<CR>", {silent = true})

-- easier moving between splits
--map("n", "<c-j>", "<c-w><c-J>", {})
--map("n", "<C-K>", "<C-W><C-K>", {})
--map("n", "<C-L>", "<C-W><C-L>", {})
--map("n", "<C-H>", "<C-W><C-H>", {})

-- Sizing window
--map("n", "<A-,>", "<C-W>5<", {})
--map("n", "<A-.>", "<C-W>5>", {})
--map("n", "<A-t>", "<C-W>+", {})
--map("n", "<A-s>", "<C-W>-", {})

-- open netrw size 30
map("n", "<Leader>pv", ":30Lex<CR>", {silent=true})

-- undotree
map("n", "<leader>u", ":UndotreeShow<CR>", {})

-- try this
map("v", "<leader>p", '"_dP', {noremap=true})
