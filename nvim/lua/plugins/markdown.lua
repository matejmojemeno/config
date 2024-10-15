-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers. Good. Kinda buggy and not maintained
-- but good
return {
	{
		"n-crespo/nvim-markdown",
		lazy = true,
		ft = "markdown",
		config = function()
			vim.g.vim_markdown_toc_autofit = 1
			-- vim.g.vim_markdown_math = 1
			vim.keymap.set(
				"n",
				"<leader>m",
				"<cmd>setlocal syn=markdown<cr>",
				{ silent = false, desc = "Conceal Math", buffer = true }
			) -- this is only used when something breaks
		end,
		init = function()
			-- for markdown math viewing
			-- note: using `:ownsyntax on` will also display math correctly, but it will
			-- also reset all spell options which is kind of a pain. the below is better
			vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
				pattern = { "*.md" },
				callback = function()
					vim.cmd([[
        setlocal syn=markdown
        ]])
				end,
			})
		end,
	},

	{
		"jbyuki/nabla.nvim",
		keys = {
			{ "<leader>ee", ':lua require"nabla".toggle_virt()<cr>' },
			{ "<leader>eh", ':lua require"nabla",popup()<cr>' },
		},
	},
	{ "ixru/nvim-markdown" },

	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
