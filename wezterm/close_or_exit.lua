local wezterm = require("wezterm")

return {
	-- Check if Neovim is running in the current pane
	close_or_exit = function(window, pane)
		local success, stdout, stderr = wezterm.run_child_process({ "pgrep", "-lf", "nvim" })

		-- If Neovim is running in this pane, send the quit command to Neovim
		if success and stdout:find(tostring(pane:pane_id())) then
			window:perform_action(wezterm.action({ SendString = ":wq\r" }), pane)
		else
			-- Otherwise, close the WezTerm pane
			window:perform_action(wezterm.action({ CloseCurrentPane = { confirm = false } }), pane)
		end
	end,
}
