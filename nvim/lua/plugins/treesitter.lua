return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate", 
  config = function() 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { 
          -- "c", 
          "lua", 
          "vim", 
          "vimdoc",
          "python",
          "markdown", 
          "markdown_inline", 
          "bash",
          "gitignore", 
          "yaml", 
          "json", 
          "dockerfile"
        },
        highlight = { enable = true },
        indent = { enable = true },  
        rainbow = { enable = true},
      })
  end, 
}
