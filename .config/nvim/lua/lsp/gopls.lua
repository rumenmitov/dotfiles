local utils = require("lsp/utils")

vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go' },
  root_markers = { 'go.mod' },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("gopls")
