---@param p table Signet palette
---@return table<string, table>
local function diff(p)
  return {
    DiffAdd = { bg = p.diff_add },
    DiffChange = { bg = p.diff_change },
    DiffDelete = { fg = p.fg3, bg = p.diff_del },
    DiffText = { bg = p.diff_text },
  }
end

return diff
