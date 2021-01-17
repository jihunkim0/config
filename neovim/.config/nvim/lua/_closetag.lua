vim.cmd [[packadd vim-closetag]]

local g = vim.g

g.closetag_filenames = "*.html,*.xhtml,*.phtml"
g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
g.closetag_filetypes = "html,xhtml,phtml"
g.closetag_xhtml_filetypes = "xhtml,jsx"
g.closetag_emptyTags_caseSensitive = 1

g.closetag_shortcut = ">"
g.closetag_close_shortcut = "<leader>>"
