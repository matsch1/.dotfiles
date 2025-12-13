local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

--- Styling
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.7
config.enable_tab_bar = false

--- Startup Behavior
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)
config.default_prog = { "zellij" }

--- Shutdown Behavior
config.window_close_confirmation = "NeverPrompt"

return config
