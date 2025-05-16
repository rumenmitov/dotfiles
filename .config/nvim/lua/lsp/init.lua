vim.opt.completeopt = "preinsert,noselect,menuone"
vim.lsp.inlay_hint.enable(true)

require("lsp/luals")
require("lsp/clangd")
require("lsp/hls")
require("lsp/gopls")
require("lsp/rust_analyzer")
require("lsp/nixd")
require("lsp/phpactor")
require("lsp/sqls")
