Config { 

   -- appearance
     font =         "Caskaydia Cove Nerd Font 12"
   , bgColor =      "black"
   , fgColor =      "#dadada"
   , position =     TopH 30
   , border =       NoBorder
   , borderColor =  "#646464"
   , alpha =        70

   -- layout
   , sepChar =  "%"
   , alignSep = "}{" 
   , template = "%XMonadLog% } %date% { %battery% "

   -- general behavior
   , overrideRedirect = False
   , pickBroadest =     True

   , commands = [
                Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                , Run XMonadLog
                , Run Battery [
                      "--template", "🔋 <left>%"
                    , "--Low",      "10"
                    , "--High",     "80"
                    , "--low",      "#ff1212"
                    , "--normal",   "#646464"
                    , "--high",     "#12ff12"
                ] 50
   ]
}
