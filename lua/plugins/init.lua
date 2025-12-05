return {
	-- Colorscheme
	-- {
	-- 	"miikanissi/modus-themes.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("modus-themes").setup({
	-- 			-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
	-- 			-- `auto` will automatically set style based on background set with vim.o.background
	-- 			style = "auto",
	-- 			variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd([[colorscheme modus]])
	-- 	end,
	-- },

	{
		"Shatur/neovim-ayu",
		priority = 1000,
		config = function()
			-- require("ayu").setup({
			-- 	overrides = {
			-- 		Normal = { bg = "None" },
			-- 		NormalFloat = { bg = "none" },
			-- 		ColorColumn = { bg = "None" },
			-- 		SignColumn = { bg = "None" },
			-- 		Folded = { bg = "None" },
			-- 		FoldColumn = { bg = "None" },
			-- 		CursorLine = { bg = "None" },
			-- 		CursorColumn = { bg = "None" },
			-- 		VertSplit = { bg = "None" },
			-- 	},
			-- })

			vim.cmd([[colorscheme ayu]])
		end,
	},

	require("plugins.langs"),
}
