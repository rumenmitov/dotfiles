local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local colorschemes = { 'Horizon Dark (base16)',  'rose-pine-dawn' }

wezterm.on('toggle-theme', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.color_scheme or overrides.color_scheme == colorschemes[2] then
    overrides.color_scheme = colorschemes[1]
  else
    overrides.color_scheme = colorschemes[2]
  end

  window:set_config_overrides(overrides)
end)

config = {
  enable_wayland = true,

  font_size = 12,
  font = wezterm.font_with_fallback {
    'Fira Code',
    'Noto Color Emoji',
    'CaskaydiaCove',
    'JetBrains Mono',
  },

  color_scheme = colorschemes[1],
  window_background_opacity = 0.9,

  default_cursor_style = "BlinkingBar",

  window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
  },

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,

  window_close_confirmation = 'NeverPrompt',

  disable_default_key_bindings = true,
  keys = {
    { key = 'Tab', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
    { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'ALT', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'ALT', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'ALT', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'ALT', action = wezterm.action.ActivateTab(8) },
    { key = '0', mods = 'ALT', action = wezterm.action.ActivateTab(9) },
    { key = '+', mods = 'CTRL|SHIFT', action = wezterm.action.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
    { key = '=', mods = 'CTRL', action = wezterm.action.ResetFontSize },
    { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo("Clipboard") },
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom("Clipboard") },
    { key = 'v', mods = 'ALT', action = wezterm.action.ScrollByPage(-1) },
    { key = 'v', mods = 'CTRL|ALT', action = wezterm.action.ScrollByPage(1) },
    { key = 'f', mods = 'CTRL', action = wezterm.action.EmitEvent 'toggle-theme' }
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
