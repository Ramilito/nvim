local M = {
	-- "folke/tokyonight.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvim-lua/plenary.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"windwp/nvim-spectre",
	"folke/twilight.nvim",
	"famiu/bufdelete.nvim",
	"mbbill/undotree",
	{"numToStr/Comment.nvim", lazy = false},
	{ "MunifTanjim/nui.nvim", lazy = false },
	{ "catppuccin/nvim", lazy = false, priority = 100 },
	-- { "folke/neoconf.nvim", cmd = "Neoconf" },
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		config = true,
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
		end,
	},
	{ "akinsho/toggleterm.nvim" },
	{
		"norcalli/nvim-terminal.lua",
		ft = "terminal",
		config = true,
	},
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{
				"<leader>sR",
				function()
					require("ssr").open()
				end,
				mode = { "n", "x" },
				desc = "Structural Replace",
			},
		},
	},

	-- require("user.plugins.noice"),
	-- require("user.plugins.mason"),
	-- require("user.plugins.neo-tree")
}

return M
