local wo = vim.wo
local o = vim.o
local bo = vim.bo
local g = vim.g
local home = vim.fn.expand("$XDG_CONFIG_HOME")
local data = vim.fn.stdpath("data")

if vim.fn.executable("volta") then
  vim.g.node_host_prog = vim.fn.trim(vim.fn.system("volta which neovim-node-host"))
end

--g.mapleader = "\\"
g.netrw_browse_split = 2
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_localrmdir='rm -r'

-- live preview s/r
o.inccommand = "nosplit"

vim.api.nvim_command('set nocompatible')

wo.cursorline = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.wrap = false

--wo.colorcolumn = "80"
o.termguicolors = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
bo.expandtab = true
bo.tabstop = 2
bo.smartindent = true
bo.shiftwidth = 2

o.updatetime = 50
o.hidden = true

o.splitbelow = true
o.splitright = true

o.ignorecase = true
o.smartcase = true

o.clipboard = "unnamedplus"

-- Backup, undo, swap options
o.undofile = true
o.backup = false
o.writebackup = false
o.backupdir = data .. "/tmp/dir_backup/"
o.directory = data .. "/tmp/dir_swap/," .. o.directory
o.undodir = data .. "/tmp/dir_undo/"
