local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

--- Styling
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.7
config.enable_tab_bar = false

--- Link Behavior
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

--- Startup Behavior
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)
config.default_prog = { "zellij" }

--- Shutdown Behavior
config.window_close_confirmation = "NeverPrompt"

return config
