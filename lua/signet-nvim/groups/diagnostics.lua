---@param p table Signet palette
---@return table<string, table>
local function diagnostics(p)
  return {
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticHint = { fg = p.cyan },
    DiagnosticOk = { fg = p.green },

    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.cyan },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.green },

    DiagnosticVirtualTextError = { fg = p.red, bg = p.diag_error },
    DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.diag_warn },
    DiagnosticVirtualTextInfo = { fg = p.blue, bg = p.diag_info },
    DiagnosticVirtualTextHint = { fg = p.cyan, bg = p.diag_hint },
    DiagnosticVirtualTextOk = { fg = p.green, bg = p.diff_add },

    DiagnosticSignError = { link = 'DiagnosticError' },
    DiagnosticSignWarn = { link = 'DiagnosticWarn' },
    DiagnosticSignInfo = { link = 'DiagnosticInfo' },
    DiagnosticSignHint = { link = 'DiagnosticHint' },
    DiagnosticSignOk = { link = 'DiagnosticOk' },

    DiagnosticFloatingError = { link = 'DiagnosticError' },
    DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
    DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
    DiagnosticFloatingHint = { link = 'DiagnosticHint' },
    DiagnosticFloatingOk = { link = 'DiagnosticOk' },

    DiagnosticDeprecated = { strikethrough = true },
    DiagnosticUnnecessary = { fg = p.fg3 },

    DiagnosticVirtualLinesError = { link = 'DiagnosticError' },
    DiagnosticVirtualLinesWarn = { link = 'DiagnosticWarn' },
    DiagnosticVirtualLinesInfo = { link = 'DiagnosticInfo' },
    DiagnosticVirtualLinesHint = { link = 'DiagnosticHint' },
    DiagnosticVirtualLinesOk = { link = 'DiagnosticOk' },
  }
end

return diagnostics
