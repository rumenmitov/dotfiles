local utils = require("lsp/utils")

vim.lsp.config.nixd = {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    on_attach = utils.enableAutoComplete,
}

vim.lsp.enable("nixd")
