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
                [[              |  1. EAT    🍎   |                 ]],
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
        config = function ()
            require("tokyonight").setup({
                styles = {
                    comments = { italic = true },
                },
            })
        end
    },
}
