require("lazy").setup("user.plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "tokyonight", "habamax", "catppuccin" } },
	checker = { enabled = true },
	diff = {
		cmd = "terminal_git",
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
