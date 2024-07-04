import qualified Data.Map.Strict as Map

import XMonad
import XMonad.Operations
import XMonad.Util.XUtils
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
import XMonad.Actions.ToggleFullFloat
import XMonad.Actions.CycleWS
import XMonad.Actions.UpdateFocus
import XMonad.Actions.NoBorders
import XMonad.Actions.Promote
import XMonad.Actions.WithAll
import XMonad.Actions.Submap
import XMonad.Actions.Search
import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Man
import XMonad.Prompt.Pass
import XMonad.Prompt.Window ( windowPrompt )
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.OrgMode (orgPrompt)

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
      _icons :: XMonad.Query [String]
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

_layoutHook =
  smartSpacingWithEdge 3
  $ renamed [Replace ""]
  $ Tall tiles_in_master delta master_ratio
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

_promptConfig :: XPConfig
_promptConfig = def
  { font                   = "xft:Hack:pixelsize=18"
  , height                 = 25
  , bgColor                = "#000114"
  , fgColor                = "#adadad"
  , bgHLight               = "#000000"
  , fgHLight               = "#d000ff"
  , borderColor            = "#d000ff"
  , position               = Top
  , maxComplRows           = Just 5
  , maxComplColumns        = Just 1
  , searchPredicate        = fuzzyMatch
  , sorter                 = fuzzySort
  , completionKey          = (controlMask, xK_n)
  , prevCompletionKey      = (controlMask, xK_p)
  , promptKeymap           = emacsLikeXPKeymap
  }

_helpWinConfig :: WindowConfig
_helpWinConfig = def
  { winBg   = bgHLight _promptConfig
  , winFg   = fgHLight _promptConfig
  , winRect = CenterWindow
  , winFont = "xft:monospace-20"
  }


_keybinds =

    -- Applications
    [ ("M-x", visualSubmap _helpWinConfig . Map.fromList $
        [ ((0, xK_Return)  , subName "Emacs"                $ spawn "emacsclient -c")
        , ((0, xK_b)       , subName "Browser"              $ spawn "librewolf")
        , ((0, xK_f)       , subName "File Manager"         $ namedScratchpadAction _scratchpads "file-manager")
        , ((0, xK_m)       , subName "Music"                $ namedScratchpadAction _scratchpads "music")
        , ((0, xK_x)       , subName "Application Launcher" $ runOrRaisePrompt _promptConfig)
        ])


    -- Quick Launches
    , ("M-<Return>"    , spawn "alacritty")
    , ("M-S-<Return>"  , namedScratchpadAction _scratchpads "quick-term")
    , ("M-n"           , orgPrompt _promptConfig {
                                                  defaultPrompter = \_ -> "Note: "
                                                } "TODO" "~/Other/Nextcloud/org/agenda/notes.org")

    -- System
    , ("M-c", visualSubmap _helpWinConfig . Map.fromList $
        [ ((0, xK_Return)   , subName "Kill Focused"            $ kill)
        , ((0, xK_Tab)      , subName "Next Screen"             $ nextScreen)
        , ((0, xK_b)        , subName "Toggle Border"           $ withFocused toggleBorder)
        , ((0, xK_f)        , subName "Toggle Fullscreen"       $ withFocused toggleFullFloat)
        , ((0, xK_p)        , subName "Promote Focused"         $ promote)
        , ((0, xK_c)        , subName "Clear Clipboard"         $ spawn "pkill greenclip && greenclip clear && greenclip daemon &")
        , ((0, xK_x)        , subName "Kill All Except Focused" $ killOthers)
        ])

    -- Utils
    , ("<XF86MonBrightnessUp>"   , spawn "brightnessctl set +5")
    , ("<XF86MonBrightnessDown>" , spawn "brightnessctl set 5-")
    , ("<XF86AudioRaiseVolume>"  , spawn "pamixer -i 10")
    , ("<XF86AudioLowerVolume>"  , spawn "pamixer -d 10")
    , ("<XF86AudioMute>"         , spawn "pamixer -t")
    , ("M-S-s"                   , spawn "shutter -s --output=~/Pictures/Screenshots/$(date +%s).png")
    , ("M-S-c"                   , spawn "xkill")


    -- Various popup menus
    , ("M-S-q"  , spawn "~/.local/share/scripts/power-menu.sh")
    , ("M-."    , spawn "~/.local/share/scripts/emojis.sh")
    , ("M-,"    , spawn "~/.local/share/scripts/math-symbols.sh")
    , ("M-S-v"  , spawn "~/.local/share/scripts/clipboard.sh")
    , ("M-w"    , spawn "~/.local/share/scripts/wallpaper.sh")


    -- Search Engines
    , ("M-s", visualSubmap _helpWinConfig . Map.fromList $
        [ ((0, xK_Return)       , subName "Web Search"    $ promptSearchBrowser' _promptConfig "librewolf" duckduckgo)
        , ((0, xK_n)            , subName "NixOS"         $ promptSearchBrowser' _promptConfig "librewolf" nixos)
        , ((0, xK_y)            , subName "Youtube"       $ promptSearchBrowser' _promptConfig "librewolf" youtube)
        , ((0, xK_g)            , subName "Github"        $ promptSearchBrowser' _promptConfig "librewolf" github)
        , ((0, xK_h)            , subName "Man Pages"     $ manPrompt _promptConfig)          
        ])


    -- Password Manager
    , ("M-p", visualSubmap _helpWinConfig . Map.fromList $
        [ ((0, xK_Return)       , subName "Passwords"     $ passPrompt _promptConfig)
        , ((0, xK_g)            , subName "Generate New"  $ passGeneratePrompt _promptConfig)
        , ((0, xK_e)            , subName "Edit"          $ passEditPrompt _promptConfig)
        , ((0, xK_BackSpace)    , subName "Remove"        $ passRemovePrompt _promptConfig)

        ])

    ]

_removeKeybinds =
    [ ]

xmonadConfig = def
  { modMask            = mod4Mask
  , focusedBorderColor = "#000000"
  , normalBorderColor  = "#000000"
  , startupHook        = _startupHook
  , handleEventHook    = focusOnMouseMove
  , layoutHook         = _layoutHook
  , manageHook         = namedScratchpadManageHook _scratchpads
  , terminal           = "alacritty"
  }


main :: IO ()
main = do
  xmonad
    $ toggleFullFloatEwmhFullscreen
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
