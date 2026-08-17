---@param p table Signet palette
---@return table<string, table>
local function lsp(p)
  return {
    LspReferenceText = { bg = p.bg5 },
    LspReferenceRead = { bg = p.bg5 },
    LspReferenceWrite = { bg = p.bg5, bold = true },
    LspReferenceTarget = { bg = p.bg5 },

    LspInlayHint = { fg = p.fg3, bg = p.bg4, italic = true },
    LspCodeLens = { fg = p.fg2 },
    LspCodeLensSeparator = { fg = p.fg3 },
    LspSignatureActiveParameter = { fg = p.accent, bold = true },

    -- Semantic token base types, linked back to the matching Treesitter capture.
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.decorator'] = { link = '@function.macro' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.parameter'] = { link = '@variable.parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.struct'] = { link = '@type' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.typeParameter'] = { link = '@type.definition' },
    ['@lsp.type.variable'] = { link = '@variable' },

    ['@module'] = { fg = p.yellow },
  }
end

return lsp
