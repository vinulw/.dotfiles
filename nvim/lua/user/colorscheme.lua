local colorscheme = "tokyonight" -- maybe switch back to gruvbox

vim.opt.background = "dark"
--vim.g.everforest_background="soft"
--vim.g.everforest_performance = 1
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "not found!")
  return 
end
