local utils = require("lsp/utils")

vim.lsp.config.sqls = {
    cmd = { 'sqls' },
    filetypes = { 'sql' },
    on_attach = utils.enableAutoComplete,
}

vim.lsp.enable("sqls")
