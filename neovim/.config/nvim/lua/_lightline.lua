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

cmds.addEventListener('update lightline when lsp diagnostics is updated', { 'User LspDiagnosticsChanged', 'User LspMessageUpdate', 'User LspStatusUpdate' }, function ()
  vim.cmd('call lightline#update()')
end)


