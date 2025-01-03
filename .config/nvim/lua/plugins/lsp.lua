local LspServers = {
    'ts_ls',
    'rust_analyzer',
    'cssls',
    'clangd',
    'lua_ls',
    'gopls',
    'html',
    'nil_ls',
    'hls'
}


return {

    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "html",
                "haskell",
                "nix",
                "tree-sitter-hyprlang"
            },

            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    },

    'onsails/lspkind.nvim',
    'romgrk/nvim-treesitter-context',

    {
        "folke/neodev.nvim",
        opts = {},
        config = function ()
            require("neodev").setup({
                override = function(root_dir, library)
                    if root_dir:find("/etc/nixos", 1, true) == 1 then
                        library.enabled = true
                        library.plugins = true
                    end
                end,
            })
        end
    },

    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup({})
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
        }
    },

    'hrsh7th/cmp-buffer',
    'sar/cmp-lsp.nvim',
    'hrsh7th/cmp-path',

    {
        'hrsh7th/nvim-cmp',
        config = function ()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                completion = { completeopt = 'menu,menuone,noinsert' },

                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                    }),
                    fields = {'abbr', 'kind', 'menu'},
                    expandable_indicator = true
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }, {
                    { name = 'buffer' },
                }),
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            for _, server in pairs(LspServers) do
                require('lspconfig')[server].setup {
                    capabilities = capabilities
                }
            end
        end
    },

    {
        'neovim/nvim-lspconfig',
        priority = 1000,
        config = function ()
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup({})
            lspconfig.dartls.setup({})
            lspconfig.hls.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = false
                    },
                },
            })

            vim.lsp.inlay_hint.enable()

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gf', vim.lsp.buf.format, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'grR', vim.lsp.buf.references, {})
            vim.keymap.set('n', 'grs', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', 'grr', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, {})

            vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(
                vim.lsp.handlers.hover,
                {border = "single"}
                )

            vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(
                vim.lsp.handlers.signature_help,
                {border = "single"}
                )

            vim.diagnostic.config{
                float = { border = "single" }
            }

        end
    },
}
