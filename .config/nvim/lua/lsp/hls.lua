local utils = require("lsp/utils")

vim.lsp.config.hls = {
  cmd = { 'haskell-language-server-wrapper', "--lsp" },
  filetypes = { 'haskell' },
  root_markers = { ".cabal" },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("hls")
