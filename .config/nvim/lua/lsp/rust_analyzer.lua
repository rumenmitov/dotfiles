local utils = require("lsp/utils")

vim.lsp.config.rust_analyzer = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml' },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("rust_analyzer")
