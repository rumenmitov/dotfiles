import Xmobar

config :: Config
config = defaultConfig { 

   -- appearance
     font =         "Caskaydia Cove Nerd Font 12"
   , bgColor =      "black"
   , fgColor =      "#dadada"
   , position =     TopH 30
   , border =       NoBorder
   , borderColor =  "#646464"
   , alpha =        170

   -- layout
   , sepChar =  "%"
   , alignSep = "}{" 
   , template = "%XMonadLog% } %date% { %battery% "

   -- general behavior
   , overrideRedirect = False
   , allDesktops      = True

   , commands = [
                Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                , Run XMonadLog
                , Run Battery
                      [ "--template", "<action=`/home/rumen/.local/share/scripts/battery-info.sh`>🔋 <left>%</action>"
                      , "--Low",      "15"
                      , "--High",     "80"
                      , "--low",      "red"
                      , "--normal",   "yellow"
                      , "--high",     "green"
                      , "--"
                      , "-A",         "15"
                      , "-a",         "/home/rumen/.local/share/scripts/battery-warning.sh"
                      ] 50
   ]
}

main :: IO ()
main = xmobar config
