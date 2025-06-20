return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    lazy=false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-lotus")
    end,
  }
}
