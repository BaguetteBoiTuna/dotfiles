local wezterm = require("wezterm")

-- Enable auto-reload of config file when changes are detected
wezterm.on("window-config-reloaded", function(window, pane)
	window:toast_notification("Configuration reloaded", "", nil, 5000)
end)

return {
	automatically_reload_config = true, -- Automatically reload when the config file changes

	-- Hide the tab bar if there's only one tab
	hide_tab_bar_if_only_one_tab = true,

	-- Remove the title bar while keeping the ability to resize the window
	window_decorations = "RESIZE",

	-- Set window transparency
	window_background_opacity = 0.75,

	-- Set padding around the window
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	-- Set initial window size
	initial_cols = 82,
	initial_rows = 24,

	-- Font settings
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
	}),
	font_size = 10.0,

	-- Color scheme based on your Alacritty config
	colors = {
		foreground = "#ABB2BF",
		background = "#161616",
		ansi = {
			"#32363D", -- black
			"#E06B74", -- red
			"#98C379", -- green
			"#E5C07A", -- yellow
			"#62AEEF", -- blue
			"#C778DD", -- magenta
			"#55B6C2", -- cyan
			"#ABB2BF", -- white
		},
		brights = {
			"#50545B", -- bright black
			"#EA757E", -- bright red
			"#A2CD83", -- bright green
			"#EFCA84", -- bright yellow
			"#6CB8F9", -- bright blue
			"#D282E7", -- bright magenta
			"#5FC0CC", -- bright cyan
			"#B5BCC9", -- bright white
		},
	},

	-- Scrollback history
	scrollback_lines = 10000,

	-- Cursor configuration
	cursor_blink_rate = 750,
	default_cursor_style = "BlinkingBlock",
	cursor_thickness = "0.15cell",

	-- Disable the audible bell
	audible_bell = "Disabled",

	-- Right-click to paste from clipboard
	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	},

	-- Enable clickable links
	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\bmailto:[\\w._%+-]+@[\\w.-]+\\.[a-z]{2,}\\b",
			format = "$0",
		},
	},
}
