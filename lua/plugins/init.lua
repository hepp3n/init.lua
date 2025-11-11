return {
	-- Colorscheme
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme modus]])
		end,
	},

	require("plugins.langs"),
}
