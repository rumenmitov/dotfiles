import XMonad
import XMonad.Operations
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Renamed
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdateFocus
import XMonad.StackSet as W
import XMonad.ManageHook

_startupHook :: X ()
_startupHook = do
  adjustEventInput
  spawnOnce "xrandr --output eDP --primary --mode 1920x1200"
  spawnOnce "xrandr --output HDMI-A-0 --mode 1920x1080 --right-of eDP"
  spawnOnce "xwallpaper --zoom ~/.local/share/wallpapers/2.jpg"
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "xinput --set-prop 9 310 0.8"
  spawnOnce "greenclip daemon"
  spawnOnce "emacs --daemon"

_xmobarPP :: PP
_xmobarPP = def
  { ppSep             = magenta " • "
  , ppTitleSanitize   = xmobarStrip
  , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
  , ppHidden          = white . wrap " " ""
  , ppHiddenNoWindows = lowWhite . wrap " " ""
  , ppUrgent          = red . wrap (yellow "!") (yellow "!")
  , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
  , ppExtras          = [logTitles formatFocused formatUnfocused]
  }
    where
      formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
      formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

      ppWindow :: String -> String
      ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

      blue, lowWhite, magenta, red, white, yellow :: String -> String
      magenta  = xmobarColor "#ff79c6" ""
      blue     = xmobarColor "#bd93f9" ""
      white    = xmobarColor "#f8f8f2" ""
      yellow   = xmobarColor "#f1fa8c" ""
      red      = xmobarColor "#ff5555" ""
      lowWhite = xmobarColor "#bbbbbb" ""

_layoutHook = renamed [Replace ""] $  ThreeCol tiles_in_master delta master_ratio
  where
    tiles_in_master  = 1         -- number of master tiles
    delta            = 3/100     -- by how much to change the size of the tile
    master_ratio     = 1/2       -- master size compared to screen

_scratchpads = [
    NS "quick-term" "alacritty --title \"Alacritty - Float\"" (title =? "Alacritty - Float")
      (customFloating $ W.RationalRect (1/16) (1/16) (7/8) (7/8))

  , NS "file-manager" "nautilus" (className =? "org.gnome.Nautilus")
      (customFloating $ W.RationalRect (1/8) (1/8) (3/4) (3/4))
  ]

_keybinds =

    -- Applications
    [ ("M-e",           spawn "emacs")
    , ("M-b",           spawn "librewolf")
    , ("M-<Return>",    spawn "alacritty")
    , ("M-f",           namedScratchpadAction _scratchpads "file-manager")
    , ("M-S-<Return>",  namedScratchpadAction _scratchpads "quick-term")

    -- System
    , ("M-c",          kill)
    , ("M-<Tab>", nextScreen)

    -- Utils
    , ("<XF86MonBrightnessUp>",   spawn "brightnessctl set +5")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5-")
    , ("<XF86AudioRaiseVolume>",  spawn "pamixer -i 10")
    , ("<XF86AudioLowerVolume>",  spawn "pamixer -d 10")
    , ("<XF86AudioMute>",         spawn "pamixer -t")
    , ("M-S-s",                   spawn "shutter -s")


    -- Various popup menus
    , ("M-S-q",   spawn "~/.local/share/scripts/power-menu.sh")
    , ("M-r",     spawn "rofi -i -show-icons -show combi -combi-modes \"window,run,ssh\"")
    , ("M-.",     spawn "cat ~/.local/share/emojis/emojis.csv | rofi -i -dmenu | awk '{print $1}' | tr -d \"\n\" | xclip -selection c")
    , ("M-,",     spawn "cat ~/.local/share/emojis/math.csv | rofi -i -dmenu | awk '{print $1}' | tr -d \"\n\" | xclip -selection c")
    , ("M-S-v",   spawn "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'")
    , ("M-p",     spawn "rofi-pass >/dev/null | xclip -selection c")
    , ("M-w",     spawn "~/.local/share/scripts/wallpaper.sh")
    ]

_removeKeybinds =
    [
     "M-S-c"
    ]

xmonadConfig = def
  { modMask            = mod4Mask
  , focusedBorderColor = "#ededed"
  , normalBorderColor  = "#000000"
  , startupHook        = _startupHook
  , handleEventHook    = focusOnMouseMove
  , layoutHook         = _layoutHook
  , manageHook         = namedScratchpadManageHook _scratchpads
  , terminal           = "alacritty"
  }


main :: IO ()
main = xmonad
    $ ewmhFullscreen
    $ ewmh
    $ withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure _xmobarPP)) toggleStrutsKey
    $ keybinds
      where
        toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
        toggleStrutsKey XConfig{ modMask = m } = (m, xK_d)
        keybinds                               = additionalKeysP remove _keybinds
        remove                                 = removeKeysP xmonadConfig _removeKeybinds
