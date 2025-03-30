local utils = require("lsp/utils")

vim.lsp.config.clangd = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'h', 'cc', 'hh', 'cpp', 'hpp' },
  root_markers = { '.clangd' },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("clangd")
