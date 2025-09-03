local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'Fira Code'
config.font_size = 12.0
config.color_scheme = 'Dracula'
config.window_decorations = "TITLE"
config.enable_tab_bar = true
config.integrated_title_button_style = "Gnome"

local default_prog = { "/usr/bin/fish" }
config.default_prog = default_prog

local default_opacity = 0.8
config.window_background_opacity = default_opacity

wezterm.on("toggle-opacity", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local current_opacity = overrides.window_background_opacity
  if current_opacity then
    overrides.window_background_opacity = nil  -- Back to default (0.8)
  else
    overrides.window_background_opacity = 1.0  -- Opaque
  end
  window:set_config_overrides(overrides)
end)

config.keys = {
  { key = "O", mods = "CTRL", action = wezterm.action.EmitEvent("toggle-opacity") }
}

return config