---@param p table Signet palette
---@return table<string, table>
local function groups(p)
  return vim.tbl_extend(
    'force',
    require('signet-nvim.groups.editor')(p),
    require('signet-nvim.groups.syntax')(p),
    require('signet-nvim.groups.treesitter')(p),
    require('signet-nvim.groups.lsp')(p),
    require('signet-nvim.groups.diagnostics')(p),
    require('signet-nvim.groups.diff')(p)
  )
end

return groups
