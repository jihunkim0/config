if vim.inspect(vim.g.vscode) == 1 then
  print('Vscode detected...')
else
  print('Vscode not detected...')
  require('_packages')
  require('_settings')
  require('_autocmds')
  require('_mappings')
  require('_theme')
  require('_colorizer')

  require('_lsp')
  require('_completion')
  require('_diagnostic')

  require('_treesitter')
  require('_telescope')
  require('_devicons')
  require('_lightline')

  --require('jihun/statusline')
  --require('_status')
  --require('_tree')
end
