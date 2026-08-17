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

    -- Semantic token types, linked to the matching Treesitter/syntax group.
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.decorator'] = { link = '@attribute' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.event'] = { link = '@type' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.keyword'] = { link = '@keyword' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.modifier'] = { link = '@keyword.modifier' },
    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.number'] = { link = '@number' },
    ['@lsp.type.operator'] = { link = '@operator' },
    ['@lsp.type.parameter'] = { link = '@variable.parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.regexp'] = { link = '@string.regexp' },
    ['@lsp.type.string'] = { link = '@string' },
    ['@lsp.type.struct'] = { link = '@type' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.typeParameter'] = { link = '@type' },
    ['@lsp.type.variable'] = { link = '@variable' },

    -- Semantic token modifiers.
    ['@lsp.mod.deprecated'] = { strikethrough = true },
    ['@lsp.mod.readonly'] = { link = '@constant' },
    ['@lsp.mod.async'] = { italic = true },
    ['@lsp.mod.static'] = { italic = true },
    ['@lsp.mod.abstract'] = { italic = true },
    ['@lsp.mod.declaration'] = { bold = true },
    ['@lsp.mod.definition'] = { bold = true },
    ['@lsp.mod.defaultLibrary'] = { italic = true },
    ['@lsp.mod.documentation'] = { italic = true },
    ['@lsp.mod.modification'] = { bold = true },
  }
end

return lsp
