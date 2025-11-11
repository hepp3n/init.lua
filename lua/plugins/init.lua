return {
	-- Colorscheme
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		config = function()
			require("modus-themes").setup({
				-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
				-- `auto` will automatically set style based on background set with vim.o.background
				style = "auto",
				variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
				transparent = true,
			})
			vim.cmd([[colorscheme modus]])
		end,
	},

	require("plugins.langs"),
}
