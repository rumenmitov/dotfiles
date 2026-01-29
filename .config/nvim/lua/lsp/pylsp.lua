local utils = require("lsp/utils")

vim.lsp.config.pylsp = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  on_attach = utils.enableAutoComplete
}

vim.lsp.enable("pylsp")
