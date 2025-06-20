return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = function()
    vim.cmd(":TSUpdate")
  end,
}
