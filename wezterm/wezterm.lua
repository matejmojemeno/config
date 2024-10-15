local wezterm = require("wezterm")
local close_or_exit = require("close_or_exit")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Appearance
config.color_scheme = "tokyonight_moon"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 15.0

-- Starts as full screen
config.initial_cols = 300
config.initial_rows = 300

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Functionality
config.window_close_confirmation = "NeverPrompt"
config.quit_when_all_windows_are_closed = false
config.enable_wayland = true

-- ZenMode
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- Smart Splits
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- Keybindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "s", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "CTRL", action = act.TogglePaneZoomState },
	{ key = "o", mods = "ALT", action = act.RotatePanes("Clockwise") },

	{ key = "w", mods = "CTRL", action = wezterm.action_callback(close_or_exit.close_or_exit) },

	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

	-- We can make separate keybindings for resizing panes
	-- But Weztljm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "ALT",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	-- { key = "n", mods = "LEADER", action = act.ShowTabNavigator },

	-- Lastly, workspace
	{ key = "Space", mods = "CTRL", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{
		key = "[",
		mods = "CTRL",
		action = act.SwitchWorkspaceRelative(1),
	},
	{
		key = "]",
		mods = "CTRL",
		action = act.SwitchWorkspaceRelative(-1),
	},

	{ key = "Q", mods = "CTRL", action = act.QuitApplication },

	{ key = "f", mods = "LEADER", action = act.ToggleFullScreen },

	-- HACK: Send Ctrl-b to the terminal so Ctrl + Backspace can work in Neovim
	{ key = "Backspace", mods = "CTRL", action = act.SendKey({ key = "b", mods = "CTRL" }) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

return config
