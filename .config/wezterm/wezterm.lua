local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
  enable_wayland = true,

  font_size = 20,
  font = wezterm.font_with_fallback {
    'Fira Code',
    'Noto Color Emoji',
    'CaskaydiaCove',
    'JetBrains Mono',
  },

  color_scheme = 'Horizon Dark (base16)',
  window_background_opacity = 0.9,

  default_cursor_style = "BlinkingBar",

  window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
  },

  enable_tab_bar = false,

  window_close_confirmation = 'NeverPrompt',

  keys = {
    { key = 'v', mods = 'ALT', action = wezterm.action.ScrollByPage(-1) },
    { key = 'v', mods = 'CTRL|ALT', action = wezterm.action.ScrollByPage(1) }
  },

  mouse_bindings = {
    {
      event = { Down = { streak = 3, button = 'Left' } },
      action = wezterm.action.SelectTextAtMouseCursor "Line",
      mods = 'NONE',
    },
  }

}


return config
