---@param p table Signet palette
---@return table<string, table>
local function syntax(p)
  return {
    Comment = { fg = p.fg2, italic = true },
    SpecialComment = { fg = p.fg2, italic = true },

    Constant = { fg = p.purple },
    String = { fg = p.green },
    Character = { fg = p.green },
    Number = { fg = p.orange },
    Float = { fg = p.orange },
    Boolean = { fg = p.orange },

    Identifier = { fg = p.fg0 },
    Function = { fg = p.accent },

    Statement = { fg = p.accent2 },
    Conditional = { fg = p.accent2 },
    Repeat = { fg = p.accent2 },
    Label = { fg = p.accent2 },
    Keyword = { fg = p.accent2 },
    Exception = { fg = p.red },
    Operator = { fg = p.fg1 },

    PreProc = { fg = p.purple },
    Include = { fg = p.purple },
    Define = { fg = p.purple },
    Macro = { fg = p.purple },
    PreCondit = { fg = p.purple },

    Type = { fg = p.blue },
    StorageClass = { fg = p.accent2 },
    Structure = { fg = p.blue },
    Typedef = { fg = p.blue },

    Special = { fg = p.purple },
    SpecialChar = { fg = p.purple },
    Tag = { fg = p.purple },
    Delimiter = { fg = p.fg1 },
    Debug = { fg = p.red },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = p.fg3 },
    Error = { fg = p.red, bold = true },
    Todo = { fg = p.yellow, bold = true },
  }
end

return syntax
