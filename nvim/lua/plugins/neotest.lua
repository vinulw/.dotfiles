return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = {"-s",}
        })
      },
      discovery = {
        enabled = true,
        concurrent = 0,
        filter_dir = function(name, rel_path, root)
          return name ~= "env"
          -- return not (rel_path:match("^/env") or rel_path:match(".-/env/") or rel_path:match("env"))
        end,
      }
    })
  end,
  keys = {
    {"<leader>ns", ":Neotest summary<CR>", desc="Test summary", mode = {"n", }},
    {"<leader>nr", ":Neotest run<CR>", desc="Test run", mode = {"n", }},
    {"<leader>nf", ":Neotest run file<CR>", desc="Test run file", mode = {"n", }},
    {"<leader>nl", ":Neotest run last<CR>", desc="Test run last", mode = {"n", }},
    {"<leader>no", ":Neotest output<CR>", desc="Test output", mode = {"n", }},
    {"<leader>np", ":Neotest output-panel<CR>", desc="Test output panel", mode = {"n", }},
  }
}
