local colorscheme = "dracula"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  return
end
