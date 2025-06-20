return {
  {
    "tpope/vim-fugitive",
    config = function()
      local keymap = vim.keymap.set
      keymap.set("n", "<leader>gd", ":Gitvdiffsplit", {desc="Git diff split" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })
        local keymap = vim.keymap
        keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", {desc="Git preview inline"})
        keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", {desc="Git next hunk"})
        keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", {desc="Git previous hunk"})
        keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", {desc="Git blame"})
        keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {desc="Git blame line"})
        keymap.set("n", "<leader>gq", ":Gitsigns setqlist<CR>", {desc="Git quickfix"})
        keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", {desc="Git diff"})
    end,
  }
}
