local utils = require("lsp/utils")

vim.lsp.config.leanls = {
  cmd = { 'lake', 'serve', '--' },
  filetypes = { 'lean' },
  root_markers = { 'lakefile.toml' },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("leanls")
