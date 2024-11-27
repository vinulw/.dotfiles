return {
    "akinsho/bufferline.nvim",
    config = function()
      bufferline = require("bufferline").setup {
      options = {
        themable=true, 
        separator_style="thick"
        }
      }
    end, 
}
