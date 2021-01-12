local cmds = require('utils')

-- lightline theme options
vim.api.nvim_set_var('lightline', {
  colorscheme = 'PaperColor',
  mode_map = {
    n = 'N',
    i = 'I',
    R = 'R',
    v = 'V',
    V = 'VL',
    ["<C-v>"] = 'VB',
    c = 'C',
    s = 'S',
    S = 'SL',
    ["<C-s>"] = 'SB',
    t = 'T'
  },
  active = {
    left = {{ 'mode', 'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified', 'lsp_status' }}
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  },
  component_expand = {
    lsp_status = 'LspStatus'
  }
})

-- gruvbox options
vim.g.gruvbox_contrast_dark = "soft"

-- ayu theme option
vim.api.nvim_set_var("ayucolor", "light")

vim.o.background = "light"
vim.api.nvim_command("colorscheme PaperColor")

vim.api.nvim_command('highlight LspDiagnosticsDefaultError guifg=#d70000')
vim.api.nvim_command('highlight LspDiagnosticsDefaultWarning guifg=#D68F00')
vim.api.nvim_command('highlight LspDiagnosticsDefaultInformation guifg=#5f8700')
vim.api.nvim_command('highlight LspDiagnosticsDefaultHint guifg=#0087af')

-- vim-illuminate coloring
-- https://github.com/RRethy/vim-illuminate
vim.api.nvim_command [[ hi LspReferenceText guibg=#E1E1E1 ]]

vim.api.nvim_exec(
[[
function! LspStatus() abort
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
    return luaeval("require('lsp-status').status()")
  else
    return '[]'
  endif
endfunction
]], true)

cmds.addEventListener('update lightline when lsp diagnostics is updated', { 'User LspDiagnosticsChanged', 'User LspMessageUpdate', 'User LspStatusUpdate' }, function ()
  vim.cmd('call lightline#update()')
end)

-- common lsp highlight configuration
vim.api.nvim_exec(
[[
augroup custom_highlight
  autocmd!
  au ColorScheme * highlight LspDiagnosticsDefaultError guifg=#E76F51
  au ColorScheme * highlight LspDiagnosticsDefaultWarning guifg=#F4A261
  au ColorScheme * highlight LspDiagnosticsDefaultInformation guifg=#5f8700
  au ColorScheme * highlight LspDiagnosticsDefaultHint guifg=#0087af
augroup END
]], true)

-- custom lsp highlight - ayu
vim.api.nvim_exec(
[[
if get(g:, 'colors_name') == 'ayu'
  augroup custom_highlight_custom
    autocmd!
    au ColorScheme * highlight LspReferenceText guibg=#E1E7EE guifg=#463F6B
  augroup END
endif
]], true)

-- custom lsp highlight - PaperColor
vim.api.nvim_exec(
[[
if get(g:, 'colors_name') == 'PaperColor'
  augroup custom_highlight_custom
    autocmd!
    au ColorScheme * highlight LspReferenceText guibg=#E1E7EE guifg=#463F6B
  augroup END
endif
]], true)

-- custom lsp highlight - gruvbox
vim.api.nvim_exec(
[[
if get(g:, 'colors_name') == 'gruvbox'
  augroup custom_highlight_custom
    autocmd!
    au ColorScheme * highlight LspReferenceText guibg=#83A598 guifg=#282828
  augroup END
endif
]], true)
