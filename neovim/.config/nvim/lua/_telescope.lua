local actions = require("telescope.actions")
local utils = require("utils")

local tele = {}

local list_theme =
  require("telescope.themes").get_dropdown(
  {
    width = 0.6,
    prompt = "",
    results_height = 20,
    previewer = false
  }
)

local full_theme = {
  winblend = 10,
  preview_cutoff = 50,
  width = 0.5,
  show_line = false,
  results_title = "",
  preview_title = "",
  prompt = "",
  short_path = true,
  word_match = "-w"
}

local mappings = {
  -- horizontal split
  ["<C-x>"] = false,
  ["<C-s>"] = actions.goto_file_selection_split,
  -- next | prev
  ["j"] = false,
  ["k"] = false,
  ["<C-j>"] = actions.move_selection_next,
  ["<C-k>"] = actions.move_selection_previous,
  -- use esc for exit no normal mode
  ["<esc>"] = actions.close
}

require("telescope").setup {
  defaults = {
    --prompt_position = "top",
    --sorting_strategy = "ascending",
    --mappings = {
    --  i = mappings,
    --  n = mappings
    --}
    file_sorter = require('telescope.sorters').get_fzy_sorters
  }
}

-- Current working directory files
function tele.fd()
  local opts = vim.deepcopy(list_theme)
  opts.prompt_prefix = "Files>"
  require "telescope.builtin".fd(opts)
end

function tele.grep_string()
  local opts = vim.deepcopy(full_theme)
  opts.prompt_prefix = "RG>"
  require "telescope.builtin".grep_string(opts)
end

function tele.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  }
end

-- keymapping
--vim.api.nvim_set_keymap('n', '<leader>pw', '<cmd> lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', { noremap=true })
utils.map("n", "<leader>pw", "<cmd> lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", {noremap=true})
utils.map("n", "<leader>pb", "<cmd> lua require('telescope.builtin').buffers()<CR>", {noremap=true})
utils.map("n", "<leader>ph", "<cmd> lua require('telescope.builtin').help_tags()<CR>", {noremap=true})
utils.map("n", "<leader>ps", "<cmd> lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", {noremap=true})
utils.map("n", "<leader>pp", "<cmd> lua require('telescope.builtin').git_files()<CR>", {noremap=true})
utils.map("n", "<Leader>pf", "<cmd> lua require('telescope.builtin').find_files()<CR>", {noremap=true})
utils.map("n", "<Leader>pl", "<cmd> lua require('telescope.builtin').live_grep()<CR>", {noremap=true})

--utils.map("n", "<Leader>p", [[<cmd>lua require'_telescope'.fd{}<CR>]], {})
--utils.map("n", "<Leader>f", [[<cmd>lua require'_telescope'.grep_string{}<CR>]], {})
--utils.map("n", "<Leader>gp", [[<cmd>lua require'_telescope'.grep_prompt{}<CR>]], {})

return tele
