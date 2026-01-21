local wezterm = require("wezterm")
local config = wezterm.config_builder()

local act = wezterm.action

-- Frontend
config.front_end = "WebGpu"

-- Font configuration
config.font = wezterm.font("Jetbrains Mono")
config.font_size = 12
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font({ family = "Jetbrains Mono", weight = "Medium" }),
	},
}

-- Window configuration
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 4,
	bottom = 2,
}
config.window_close_confirmation = "AlwaysPrompt"
config.quit_when_all_windows_are_closed = true

-- Tab bar configuration
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 50
config.tab_and_split_indices_are_zero_based = false

-- Add vertical padding to tab bar
config.window_frame = {
	font_size = 13.0,
	active_titlebar_bg = "#1a1b26",
	inactive_titlebar_bg = "#1a1b26",
}

config.color_scheme = "Tokyo Night"

-- Make active pane much more visible
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

-- Increase tab bar height
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- Custom tab bar formatting with more padding and better styling
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local cwd_uri = pane.current_working_dir
	local title = ""

	if cwd_uri then
		local cwd = cwd_uri.file_path or cwd_uri
		title = cwd:match("([^/]+)/?$") or cwd
	else
		-- Fall back to pane title
		title = tab.tab_title
		if #title == 0 then
			title = tab.active_pane.title
		end
	end

	-- Truncate title if too long
	local max_title_len = 30
	if #title > max_title_len then
		title = title:sub(1, max_title_len - 3) .. "..."
	end

	-- Style active vs inactive tabs
	local bg_color = "#292e42"
	local fg_color = "#545c7e"

	if tab.is_active then
		bg_color = "#7aa2f7"
		fg_color = "#16161e"
	end

	-- Add padding and styling
	return {
		{ Background = { Color = bg_color } },
		{ Foreground = { Color = fg_color } },
		{ Text = "  " },
		{ Text = title },
		{ Text = "  " },
	}
end)

-- Mouse configuration
config.hide_mouse_cursor_when_typing = true
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.mouse_bindings = {
	-- CTRL-Click opens hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
	-- Disable copy on select (single, double, triple click)
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.Nop,
	},
	{
		event = { Up = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act.Nop,
	},
	{
		event = { Up = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.Nop,
	},
}

-- This function returns true if the current pane is running Neovim
local function is_vim(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name or pane:get_title()

	return process_name:find("n?vim") ~= nil
end

-- This function returns true if the current pane is running Zellij
local function is_zellij(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name or pane:get_title()

	return process_name:find("zellij") ~= nil
end

-- Create navigation binding that sends a unique sequence to Neovim
local function split_nav(key, direction)
	return {
		key = key,
		mods = "SUPER", -- or 'CMD' on macOS
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- Send a complex key sequence: Alt+$ followed by the key
				-- This is extremely unlikely to conflict with any existing mappings
				win:perform_action({
					Multiple = {
						{ SendKey = { key = "$", mods = "ALT" } },
						{ SendKey = { key = key } },
					},
				}, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction }, pane)
			end
		end),
	}
end

-- Key bindings
-- Note: Using SUPER/CMD directly in all bindings (no leader key needed)
config.keys = {
	-- Split panes
	{ key = "-", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Navigate panes (using vim-like keys)
	split_nav("n", "Left"),
	split_nav("e", "Down"),
	split_nav("u", "Up"),
	split_nav("i", "Right"),
	-- Move panes
	{ key = "n", mods = "SUPER|CTRL", action = act.RotatePanes("CounterClockwise") },
	{ key = "i", mods = "SUPER|CTRL", action = act.RotatePanes("Clockwise") },

	-- Resize panes
	{ key = "n", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "e", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "u", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "i", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- Toggle between split and maximized layout (signals nvim to equalize panes)
	{
		key = "m",
		mods = "SUPER",
		action = wezterm.action_callback(function(win, pane)
			win:perform_action(act.TogglePaneZoomState, pane)
			if is_vim(pane) then
				win:perform_action({
					Multiple = {
						{ SendKey = { key = "$", mods = "ALT" } },
						{ SendKey = { key = "=" } },
					},
				}, pane)
			end
		end),
	},

	-- Scrollback (approximate kitty's scrollback functionality)
	{ key = "h", mods = "SUPER", action = act.ActivateCopyMode },

	-- Copy mode only when in vim
	{
		key = "c",
		mods = "SUPER|SHIFT",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action(act.ActivateCopyMode, pane)
			end
		end),
	},

	-- Tab navigation
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

	-- Smart search: zellij -> zellij search, nvim -> /, else -> wezterm search
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action_callback(function(win, pane)
			if is_zellij(pane) then
				win:perform_action({
					Multiple = {
						{ SendKey = { key = "a", mods = "CTRL" } },
						{ SendKey = { key = "s" } },
					},
				}, pane)
			elseif is_vim(pane) then
				win:perform_action({ SendKey = { key = "/" } }, pane)
			else
				win:perform_action(act.Search({ CaseInSensitiveString = "" }), pane)
			end
		end),
	},

	-- Unbind Alt+Enter (disable fullscreen toggle)
	{ key = "Enter", mods = "ALT", action = act.DisableDefaultAssignment },
}

-- Copy mode key bindings
config.key_tables = {
	copy_mode = {
		{ key = "n", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "e", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "u", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "i", mods = "NONE", action = act.CopyMode("MoveRight") },

		-- Word navigation
		{ key = "n", mods = "CTRL", action = act.CopyMode("MoveBackwardWord") },
		{ key = "i", mods = "CTRL", action = act.CopyMode("MoveForwardWord") },

		-- Page navigation
		{ key = "e", mods = "CTRL", action = act.CopyMode("PageDown") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("PageUp") },

		-- Selection
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({ act.CopyTo("ClipboardAndPrimarySelection"), act.CopyMode("Close") }),
		},
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
	},
}

-- macOS specific settings
if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
	config.send_composed_key_when_left_alt_is_pressed = false
	config.send_composed_key_when_right_alt_is_pressed = true
end

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

return config
