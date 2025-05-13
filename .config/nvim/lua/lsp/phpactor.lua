local utils = require("lsp/utils")

vim.lsp.config.phpactor = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_markers = { 'index.php' },
  on_attach = utils.enableAutoComplete,
}

vim.lsp.enable("phpactor")
