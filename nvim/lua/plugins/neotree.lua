return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>t", ":Neotree toggle reveal_force_cwd<CR>", {desc="Open Neotree"})
    keymap.set("n", "<leader>bs", ":Neotree toggle show buffers right<CR>", {desc="Show Buffers Neotree"})
    keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", {desc="Git Status Neotree"})

    -- Set netrw hijack
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "open_current",
                             -- "open_default",
                             -- "open_current",
                             -- "disabled",
        }
    })
  end,
}
