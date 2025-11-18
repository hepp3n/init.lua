return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		config = function()
			local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

			require("nvim-treesitter").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"html",
					"javascript",
					"json",
					"lua",
					"php",
					"python",
					"rust",
					"typescript",
					"yaml",
					"jsonc",
				},
			})

			local syntax_on = {
				php = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local bufnr = args.buf
					local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
					if not ok or not parser then
						return
					end
					pcall(vim.treesitter.start)

					local ft = vim.bo[bufnr].filetype
					if syntax_on[ft] then
						vim.bo[bufnr].syntax = "on"
					end
				end,
			})
		end,
	},
}
