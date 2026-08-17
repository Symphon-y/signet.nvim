local M = {}

---@param p table Signet palette
local function set_terminal_colors(p)
  local ansi = {
    p.bg0, p.red, p.green, p.yellow, p.blue, p.purple, p.cyan, p.fg1,
    p.bg5, p.red, p.bright_green, p.yellow, p.bright_blue, p.bright_purple, p.bright_cyan, p.fg0,
  }
  for i, color in ipairs(ansi) do
    vim.g['terminal_color_' .. (i - 1)] = color
  end
end

function M.load()
  if vim.g.colors_name then
    vim.cmd('highlight clear')
  end
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  vim.g.colors_name = 'signet'

  local p = require('signet-nvim.palette')
  local groups = require('signet-nvim.groups')(p)
  for name, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, name, hl)
  end

  set_terminal_colors(p)
end

return M
