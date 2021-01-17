local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local completion = require "completion"
local status = require "lsp-status"
--local illuminate = require "illuminate"
local utils = require "utils"
local util = require('lspconfig/util')

status.config = {
  kind_labels = vim.g.completion_customize_lsp_label
}

status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
  completion.on_attach(client)
  status.on_attach(client)
  --illuminate.on_attach(client)

  local opts = {noremap = true, silent = true}

  utils.map("n", "<leader>vd", "<cmd> lua vim.lsp.buf.definition()<CR>", {noremap = true})
  utils.map("n", "<leader>vi", "<cmd> lua vim.lsp.buf.implementation()<CR>", {noremap = true})
  utils.map("n", "<leader>vsh", "<cmd> lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  utils.map("n", "<leader>vrr", "<cmd> lua vim.lsp.buf.references()<CR>", {noremap = true})
  utils.map("n", "<leader>vrn", "<cmd> lua vim.lsp.buf.rename()<CR>", {noremap = true})
  utils.map("n", "<leader>vh", "<cmd> lua vim.lsp.buf.hover()<CR>", {noremap = true})
  utils.map("n", "<leader>vca", "<cmd> lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  utils.map(
    "n",
    "<leader>vsd",
    "<cmd> lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>",
    {noremap = true}
  )

  --utils.map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)", opts)
  --utils.map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --utils.map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  --utils.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  --utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --utils.map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  --utils.map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
  --utils.map("n", "<leader>ld", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", opts)
  --utils.map("n", "[c", "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  --utils.map("n", "]c", "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  --vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")

  --vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")

  --vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
end

require("nlua.lsp.nvim").setup(
  lspconfig,
  {
    on_attach = on_attach
  }
)

--configs.svelte = {
--  default_config = {
--    cmd = {"svelteserver", "--stdio"},
--    filetypes = {"svelte"},
--    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
--    settings = {}
--  }
--}

local servers = {
  vimls = {},
  tsserver = {
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or util.path.dirname(fname)
    end
  },
  jsonls = {},
  yamlls = {},
  --jedi_language_server = {},
  html = {
    filetypes = {"html", "jinja"}
  },
  pylance = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off"
        }
      }
    }
  }
}

require("pylance")
for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {on_attach = on_attach, capabilities = capabilities}, config))
end
