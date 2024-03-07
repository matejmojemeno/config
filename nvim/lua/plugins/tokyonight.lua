return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

    config = function()
        require("tokyonight").colorscheme()
        vim.cmd.colorscheme("tokyonight-moon")
    end,
}
