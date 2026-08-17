---@param p table Signet palette
---@return table<string, table>
local function syntax(p)
  return {
    Comment = { fg = p.fg3, italic = true },
    SpecialComment = { fg = p.fg3, italic = true },

    Constant = { fg = p.orange },
    String = { fg = p.green },
    Character = { fg = p.green },
    Number = { fg = p.orange },
    Float = { fg = p.orange },
    Boolean = { fg = p.orange, bold = true },

    Identifier = { fg = p.fg0 },
    Function = { fg = p.blue },

    Statement = { fg = p.accent },
    Conditional = { fg = p.accent },
    Repeat = { fg = p.accent },
    Label = { fg = p.accent },
    Keyword = { fg = p.accent },
    Exception = { fg = p.accent },
    Operator = { fg = p.fg1 },

    PreProc = { fg = p.purple },
    Include = { fg = p.purple },
    Define = { fg = p.purple },
    Macro = { fg = p.purple },
    PreCondit = { fg = p.purple },

    Type = { fg = p.yellow },
    StorageClass = { fg = p.yellow },
    Structure = { fg = p.yellow },
    Typedef = { fg = p.yellow },

    Special = { fg = p.cyan },
    SpecialChar = { fg = p.cyan },
    Tag = { fg = p.cyan },
    Delimiter = { fg = p.fg2 },
    Debug = { fg = p.red },

    Underlined = { underline = true },
    Ignore = { fg = p.fg3 },
    Error = { fg = p.red, bold = true },
    Todo = { fg = p.bg3, bg = p.yellow, bold = true },
  }
end

return syntax
