return {
    'nvim-tree/nvim-web-devicons',

    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')
            dashboard.section.header.val = {
                [[                                                  ]],
                [[                                                  ]],
                [[              +-----------------+                 ]],
                [[              |                 |                 ]],
                [[              |  1. EAT    🌭   |                 ]],
                [[              |                 |                 ]],
                [[              |  2. SLEEP  😴   |                 ]],
                [[              |                 |                 ]],
                [[              |  3. CODE   🖥️   |                 ]],
                [[              |                 |                 ]],
                [[              |  4. REPEAT 🔁   |                 ]],
                [[              |                 |                 ]],
                [[              +-----------------+                 ]],
                [[                                                  ]],
                [[     ▄▄▄▄▄▄   ▄▄   ▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄     ]],
                [[    █   ▄  █ █  █ █  █  █▄█  █       █  █  █ █    ]],
                [[    █  █ █ █ █  █ █  █       █    ▄▄▄█   █▄█ █    ]],
                [[    █   █▄▄█▄█  █▄█  █       █   █▄▄▄█       █    ]],
                [[    █    ▄▄  █       █       █    ▄▄▄█  ▄    █    ]],
                [[    █   █  █ █       █ ██▄██ █   █▄▄▄█ █ █   █    ]],
                [[    █▄▄▄█  █▄█▄▄▄▄▄▄▄█▄█   █▄█▄▄▄▄▄▄▄█▄█  █▄▄█    ]],
                [[                                                  ]],
                [[                                                  ]],
            }

            dashboard.section.buttons.val = {}

            alpha.setup(dashboard.config)
        end
    },

    'sainnhe/everforest',

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },


    'nvim-lualine/lualine.nvim',

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            views = {
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },

            cmdline = {
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
                    input = {},
                },
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}
