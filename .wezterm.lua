local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = 'Tokyo Night'
config.font = wezterm.font("Berkeley Mono")
config.font_size = 20
config.adjust_window_size_when_changing_font_size = false

local act = wezterm.action

config.keys = {
	-- Split windows
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Font increase/decrease
	{
		key = "+",
		mods = "CMD",
		action = act.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = act.DecreaseFontSize,
	},

	-- Next tab
	{
		key = "l",
		mods = "ALT|CMD",
		action = act.ActivateTabRelative(1),
	},

	-- Previous tab
	{
		key = "h",
		mods = "ALT|CMD",
		action = act.ActivateTabRelative(-1),
	},
}

return config
