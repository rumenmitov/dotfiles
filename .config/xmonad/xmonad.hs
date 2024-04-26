import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Renamed


_startupHook :: X ()
_startupHook = do
  spawnOnce "xrandr -s 1920x1080"
  

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
    tiles_in_master  = 1
    delta            = 3/100
    master_ratio     = 1/2


xmonad_config = def
  { modMask            = mod4Mask
  , focusedBorderColor = "#123672"
  , startupHook        = _startupHook
  , layoutHook         = _layoutHook
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
        toggleStrutsKey XConfig{ modMask = m } = (m, xK_a)
        keybinds = additionalKeysP xmonad_config [
            ("M-e", spawn "emacs"),
            ("M-b", spawn "firefox")
            ]
