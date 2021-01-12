local sign_define = vim.fn.sign_define
local utils = require "utils"

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    signs = true,
    update_in_insert = true,
  }
)

sign_define(
  "LspDiagnosticsSignError",
  {text = "", texthl = "LspDiagnosticsError"}
)

sign_define(
  "LspDiagnosticsSignWarning",
  {text = "", texthl = "LspDiagnosticsWarning"}
)

sign_define(
  "LspDiagnosticsSignInformation",
  {text = "", texthl = "LspDiagnosticsInformation"}
)

sign_define(
  "LspDiagnosticsSignHint",
  {text = "", texthl = "LspDiagnosticsHint"}
)
