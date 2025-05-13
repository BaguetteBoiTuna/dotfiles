local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	initial_cols = 120,
	initial_rows = 30,

	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "SteadyBlock",
	color_scheme = "Monokai Pro (Gogh)",

	-- comment this if its starting to hurt your eyes
	-- font = wezterm.font("Monocraft Nerd Font"),
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12.0,

	background = {
		-- uncomment this if you want to use an image background
		-- {
		-- 	source = {
		-- 		File = "/Users/dante/Pictures/Wallpapers/black-nebula.png",
		-- 	},
		-- 	hsb = {
		-- 		hue = 1.0,
		-- 		saturation = 1.02,
		-- 		brightness = 0.25,
		-- 	},
		-- 	width = "100%",
		-- 	height = "100%",
		-- },
		{
			source = {
				Color = "#000000",
			},
			width = "100%",
			height = "100%",
			opacity = 0.70,
		},
	},
	window_padding = {
		left = 40,
		right = 40,
		top = 20,
		bottom = 20,
	},
}

return config
