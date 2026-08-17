---@param p table Signet palette
---@return table<string, table>
local function treesitter(p)
  return {
    ['@variable'] = { fg = p.fg0 },
    ['@variable.builtin'] = { fg = p.orange, italic = true },
    ['@variable.parameter'] = { fg = p.fg1 },
    ['@variable.member'] = { fg = p.fg1 },
    ['@property'] = { fg = p.fg1 },

    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { fg = p.orange, bold = true },
    ['@constant.macro'] = { link = '@constant' },
    ['@boolean'] = { link = 'Boolean' },
    ['@number'] = { link = 'Number' },
    ['@number.float'] = { link = 'Float' },

    ['@string'] = { link = 'String' },
    ['@string.documentation'] = { fg = p.green, italic = true },
    ['@string.regexp'] = { fg = p.cyan },
    ['@string.escape'] = { fg = p.accent, bold = true },
    ['@string.special'] = { fg = p.cyan },
    ['@string.special.symbol'] = { fg = p.blue },
    ['@string.special.path'] = { fg = p.green, underline = true },
    ['@string.special.url'] = { fg = p.blue, underline = true },
    ['@character'] = { link = 'Character' },
    ['@character.special'] = { fg = p.cyan },

    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { fg = p.yellow, italic = true },
    ['@type.definition'] = { link = 'Type' },
    ['@constructor'] = { fg = p.yellow },

    ['@function'] = { link = 'Function' },
    ['@function.builtin'] = { fg = p.blue, italic = true },
    ['@function.call'] = { link = 'Function' },
    ['@function.macro'] = { link = '@function' },
    ['@function.method'] = { link = 'Function' },
    ['@function.method.call'] = { link = 'Function' },

    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.coroutine'] = { link = '@keyword' },
    ['@keyword.function'] = { link = '@keyword' },
    ['@keyword.operator'] = { fg = p.accent, bold = true },
    ['@keyword.import'] = { link = 'Include' },
    ['@keyword.type'] = { link = '@keyword' },
    ['@keyword.modifier'] = { link = '@keyword' },
    ['@keyword.repeat'] = { link = '@keyword' },
    ['@keyword.return'] = { link = '@keyword' },
    ['@keyword.debug'] = { link = 'Debug' },
    ['@keyword.exception'] = { link = '@keyword' },
    ['@keyword.conditional'] = { link = '@keyword' },
    ['@keyword.conditional.ternary'] = { fg = p.accent },
    ['@keyword.directive'] = { link = 'PreProc' },
    ['@keyword.directive.define'] = { link = 'Define' },

    ['@operator'] = { link = 'Operator' },

    ['@comment'] = { link = 'Comment' },
    ['@comment.documentation'] = { fg = p.fg2, italic = true },
    ['@comment.error'] = { fg = p.red, bold = true },
    ['@comment.warning'] = { fg = p.yellow, bold = true },
    ['@comment.todo'] = { link = 'Todo' },
    ['@comment.note'] = { fg = p.blue, bold = true },

    ['@punctuation.bracket'] = { fg = p.fg2 },
    ['@punctuation.delimiter'] = { fg = p.fg2 },
    ['@punctuation.special'] = { fg = p.cyan },

    ['@tag'] = { fg = p.accent },
    ['@tag.attribute'] = { fg = p.yellow, italic = true },
    ['@tag.delimiter'] = { fg = p.fg2 },

    ['@markup.heading'] = { fg = p.accent, bold = true },
    ['@markup.strong'] = { bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.underline'] = { underline = true },
    ['@markup.strikethrough'] = { strikethrough = true },
    ['@markup.link'] = { fg = p.blue },
    ['@markup.link.url'] = { fg = p.blue, underline = true },
    ['@markup.raw'] = { fg = p.green },
    ['@markup.list'] = { fg = p.accent },

    ['@diff.plus'] = { fg = p.green },
    ['@diff.minus'] = { fg = p.red },
    ['@diff.delta'] = { fg = p.yellow },
  }
end

return treesitter
