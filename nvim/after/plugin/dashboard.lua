local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
  [[            _                         _             ]],     
  [[        _==/          i     i          \==          ]],             
  [[      /XX/            |\___/|            \XX\       ]],                
  [[    /XXXX\            |XXXXX|            /XXXX\     ]],                    
  [[   |XXXXXX\_         _XXXXXXX_         _/XXXXXX|    ]],                      
  [[  XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX   ]],                   
  [[ |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|  ]],            
  [[ XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  ]],          
  [[ |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|  ]],         
  [[  XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX   ]],             
  [[   |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|    ]],            
  [[     \XX\       \X/    \XXX/    \X/       /XX/      ]],             
  [[        "\       "      \X/      "       /"         ]],                     
  [[                         !                          ]],
  [[                                                    ]],
  [[            ----- Welcome, Rumen  -----             ]],
}

dashboard.section.buttons.val = {
  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "🔎 Find File", ":Telescope find_files<CR>"),
  dashboard.button("r", "⏱  Recent Files", ":Telescope marks<CR>"),
  dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
}
alpha.setup(dashboard.config)
