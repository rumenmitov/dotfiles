import XMonad
import XMonad.Operations
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicIcons
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdateFocus
import XMonad.Actions.NoBorders
import XMonad.StackSet as W
import XMonad.ManageHook

_startupHook :: X ()
_startupHook = do
  adjustEventInput
  spawnOnce "xrandr --output eDP --primary --mode 1920x1200"
  spawnOnce "xrandr --output HDMI-A-0 --mode 1920x1080 --right-of eDP"
  spawnOnce "xset dpms 0 0 0 && xset s noblank  && xset s off"
  spawnOnce "~/.local/share/scripts/battery-warning.sh"
  spawnOnce "nitrogen --restore &"
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "xinput --set-prop 9 310 0.8"
  spawnOnce "greenclip daemon"
  spawnOnce "emacs --daemon"

_iconConfig = IconConfig
  { iconConfigIcons  = _icons
  , iconConfigFmt    = iconsFmtReplace (wrapUnwords "| " " |" . addSep )
  , iconConfigFilter = iconsGetAll
  }
  where
      _icons :: Query [String]
      _icons = composeAll
        [ className =? "librewolf"            --> appIcon "\983609"
        , className =? "firefox"              --> appIcon "\983609"
        , className =? "Alacritty"            --> appIcon "\60362"
        , className =? "Emacs"                --> appIcon "\58930"
        , className =? "org.gnome.Nautilus"   --> appIcon "\62675"
        , className =? "Gimp"                 --> appIcon "\62264"
        , className =? "rnote"                --> appIcon "\986953"
        , className =? "nuclear"              --> appIcon "\61441"
        ]

      -- This is a custom function that adds a space between two or more icons.
      -- Additionally if there are more than 2 icons, the rest (and earliest icons)
      -- are discarded and replaced with `...`.
      addSep :: [String] -> [String]
      addSep []     = []
      addSep [w]    = [w]
      addSep (w:ws) 
        | length res > 4 = (take 4 res) ++ ["..."] -- checking for 4, because each icon
                                                   -- comes with a space
        | otherwise      = res
          where
            res = w : " " : addSep ws

_xmobarPP :: PP
_xmobarPP = filterOutWsPP ["NSP"] def
  { ppSep              = magenta " • "
  , ppTitleSanitize    = xmobarStrip
  , ppCurrent          = wrap " " "" . magenta
  , ppVisible          = wrap " " "" . xmobarBorder "Top" "#ff79c6" 2
  , ppVisibleNoWindows = Just (\_ -> lowWhite " ○")
  , ppHidden           = white . wrap " " ""
  , ppHiddenNoWindows  = \_ -> lowWhite " ○"
  , ppUrgent           = red . wrap (orange "!") (orange "!")
  , ppOrder            = \[ws, _, _, wins] -> [ws, wins]
  , ppExtras           = [logTitles formatFocused formatUnfocused]
  }
    where
      formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
      formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . pink    . ppWindow

      ppWindow :: String -> String
      ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

      blue, lowWhite, magenta, red, white, yellow, orange :: String -> String
      magenta  = xmobarColor "#d000ff" ""
      pink     = xmobarColor "#ff70c1" ""
      blue     = xmobarColor "#bd93f9" ""
      white    = xmobarColor "#f8f8f2" ""
      yellow   = xmobarColor "#f1fa8c" ""
      red      = xmobarColor "#ff5555" ""
      lowWhite = xmobarColor "#bbbbbb" ""
      orange   = xmobarColor "#F5660A" ""

_layoutHook = renamed [Replace ""] $  Tall tiles_in_master delta master_ratio
  where
    tiles_in_master  = 1         -- number of master tiles
    delta            = 3/100     -- by how much to change the size of the tile
    master_ratio     = 1/2       -- master size compared to screen

_scratchpads = [
    NS "quick-term" "alacritty --title \"Alacritty - Float\"" (title =? "Alacritty - Float")
      (customFloating $ W.RationalRect (1/16) (1/16) (7/8) (7/8))

  , NS "file-manager" "nautilus" (className =? "org.gnome.Nautilus")
      (customFloating $ W.RationalRect (1/8) (1/8) (3/4) (3/4))

  , NS "music" "nuclear" (className =? "nuclear")
      (customFloating $ W.RationalRect (1/8) (1/8) (3/4) (3/4))
  ]

_keybinds =

    -- Applications
    [ ("M-e",           spawn "emacsclient -c")
    , ("M-b",           spawn "librewolf")
    , ("M-<Return>",    spawn "alacritty")
    , ("M-f",           namedScratchpadAction _scratchpads "file-manager")
    , ("M-S-<Return>",  namedScratchpadAction _scratchpads "quick-term")
    , ("M-m",           namedScratchpadAction _scratchpads "music")

    -- System
    , ("M-c",          kill)
    , ("M-<Tab>", nextScreen)
    , ("M-S-b", withFocused toggleBorder)

    -- Utils
    , ("<XF86MonBrightnessUp>",   spawn "brightnessctl set +5")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5-")
    , ("<XF86AudioRaiseVolume>",  spawn "pamixer -i 10")
    , ("<XF86AudioLowerVolume>",  spawn "pamixer -d 10")
    , ("<XF86AudioMute>",         spawn "pamixer -t")
    , ("M-S-s",                   spawn "shutter -s --output=~/Pictures/Screenshots/$(date +%s).png")
    , ("M-S-c",                   spawn "xkill")


    -- Various popup menus
    , ("M-S-q",   spawn "~/.local/share/scripts/power-menu.sh")
    , ("M-r",     spawn "dmenu_run -i -l 4 -sb \\#000000 -sf \\#d000ff")
    , ("M-.",     spawn "cat ~/.local/share/emojis/emojis.csv | dmenu -i -l 4 -sb \\#000000 -sf \\#d000ff | awk '{print $1}' | tr -d \"\n\" | xclip -selection c")
    , ("M-,",     spawn "cat ~/.local/share/emojis/math.csv | dmenu -i -l 4 -sb \\#000000 -sf \\#d000ff | awk '{print $1}' | tr -d \"\n\" | xclip -selection c")
    , ("M-S-v",   spawn "greenclip print | grep . | dmenu -i -l 4 -sb \\#000000 -sf \\#d000ff | xargs -r -d'\n' -I '{}' greenclip print '{}'")
    , ("M-p",     spawn "passmenu -i -l 4 -sb \\#000000 -sf \\#d000ff")
    , ("M-w",     spawn "~/.local/share/scripts/wallpaper.sh")
    ]

_removeKeybinds =
    [ ]

xmonadConfig = def
  { modMask            = mod4Mask
  , focusedBorderColor = "#000000"
  , normalBorderColor  = "#000000"
  , startupHook        = _startupHook
  , handleEventHook    = focusOnMouseMove
  , layoutHook         = smartSpacingWithEdge 3 $ _layoutHook
  , manageHook         = namedScratchpadManageHook _scratchpads
  , terminal           = "alacritty"
  }


main :: IO ()
main = do
  xmonad
    $ ewmhFullscreen
    $ ewmh
    $ withEasySB (statusBarProp "xmobar" (dynamicIconsPP _iconConfig _xmobarPP)) toggleStrutsKey
    $ configureKeybinds
    $ xmonadConfig
      where
        toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        toggleStrutsKey XConfig{ modMask = m } = (m, xK_d)
        configureKeybinds conf = flip additionalKeysP _keybinds
                            $ flip removeKeysP _removeKeybinds conf
