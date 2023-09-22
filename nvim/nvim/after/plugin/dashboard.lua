local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {

  [[         _..._             ]],   
  [[       .'     '.      _    ]],
  [[      /    .-""-\   _/ \   ]],   
  [[    .-|   /:.   |  |   |   ]],
  [[    |  \  |:.   /.-'-./    ]],   
  [[    | .-'-;:__.'    =/     ]],   
  [[    .'=  *=|NASA _.='      ]],   
  [[   /   _.  |    ;          ]],
  [[  ;-.-'|    \   |          ]],   
  [[ /   | \    _\  _\         ]],     
  [[ \__/'._;.  ==' ==\        ]],     
  [[          \    \   |       ]],            
  [[          /    /   /       ]],           
  [[          /-._/-._/        ]],             
  [[          \   `\  \        ]],         
  [[           `-._/._/        ]],
  [[                           ]], 
  [[ ---- Welcome, Rumen ----  ]],

}

dashboard.section.buttons.val = {
  dashboard.button( "n", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "e", "🌳 File Tree" , ":Ex<CR>"),
  dashboard.button("f", "🔎 Find File", ":Telescope find_files<CR>"),
  dashboard.button("g", "🔭 Live Grep", ":Telescope live_grep<CR>"),
  dashboard.button("r", "⏱  Recent Files", ":Telescope marks<CR>"),
  dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
}
alpha.setup(dashboard.config)



-- More ASCII art

-- [[            _                         _             ]],     
-- [[        _==/          i     i          \==          ]],             
-- [[      /XX/            |\___/|            \XX\       ]],                
-- [[    /XXXX\            |XXXXX|            /XXXX\     ]],                    
-- [[   |XXXXXX\_         _XXXXXXX_         _/XXXXXX|    ]],                      
-- [[  XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX   ]],                   
-- [[ |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|  ]],            
-- [[ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  ]],          
-- [[ |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|  ]],         
-- [[  XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX   ]],             
-- [[   |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|    ]],            
-- [[     \XX\       \X/    \XXX/    \X/       /XX/      ]],             
-- [[        "\       "      \X/      "       /"         ]],                     
-- [[                         !                          ]],
-- [[                                                    ]],
