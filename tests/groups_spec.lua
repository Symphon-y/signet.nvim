local helpers = require('tests.helpers')
local palette = require('signet-nvim.palette')

local colors = helpers.color_set(palette)

--- Declares one describe block for a groups/<mod>.lua module: it must be a
--- function(p) -> table of highlight defs, every def must resolve to a
--- palette color (or a same-module link), and `required` names must exist.
local function describe_module(mod_name, required)
  describe('signet-nvim.groups.' .. mod_name, function()
    local groups = require('signet-nvim.groups.' .. mod_name)(palette)

    it('returns a table of highlight definitions', function()
      assert.is_table(groups)
      assert.truthy(next(groups), mod_name .. ' must define at least one group')
    end)

    it('only uses palette colors and known highlight attributes', function()
      helpers.assert_valid_groups(groups, colors)
    end)

    it('defines the groups other plugins/tests depend on', function()
      for _, name in ipairs(required) do
        assert.is_not_nil(groups[name], mod_name .. ' is missing required group: ' .. name)
      end
    end)
  end)
end

describe_module('editor', {
  'Normal', 'NormalFloat', 'FloatBorder',
  'CursorLine', 'CursorLineNr', 'LineNr', 'SignColumn', 'Folded',
  'StatusLine', 'TabLineSel', 'Pmenu', 'PmenuSel',
  'Visual', 'Search', 'IncSearch', 'MatchParen',
  'Title', 'Directory', 'ErrorMsg', 'WarningMsg',
  'NonText', 'Whitespace', 'SpellBad',
})

describe_module('syntax', {
  'Comment', 'Constant', 'String', 'Character', 'Number', 'Boolean',
  'Identifier', 'Function', 'Statement', 'Conditional', 'Repeat', 'Operator',
  'Keyword', 'Exception', 'PreProc', 'Include', 'Type', 'StorageClass',
  'Special', 'SpecialChar', 'Underlined', 'Error', 'Todo',
})

describe_module('treesitter', {
  '@variable', '@variable.builtin', '@variable.parameter', '@property',
  '@constant', '@constant.builtin', '@boolean', '@number', '@string',
  '@string.escape', '@type', '@type.builtin', '@constructor', '@function',
  '@function.builtin', '@function.method', '@keyword', '@keyword.return',
  '@operator', '@comment', '@comment.todo', '@punctuation.bracket',
  '@punctuation.delimiter', '@tag', '@markup.heading', '@markup.strong',
  '@markup.link',
})

describe_module('lsp', {
  'LspReferenceText', 'LspReferenceRead', 'LspReferenceWrite',
  'LspInlayHint', 'LspCodeLens', 'LspSignatureActiveParameter',
  '@lsp.type.class', '@lsp.type.function', '@lsp.type.variable',
})

describe_module('diagnostics', {
  'DiagnosticError', 'DiagnosticWarn', 'DiagnosticInfo', 'DiagnosticHint', 'DiagnosticOk',
  'DiagnosticUnderlineError', 'DiagnosticUnderlineWarn',
  'DiagnosticSignError', 'DiagnosticSignWarn', 'DiagnosticSignInfo', 'DiagnosticSignHint', 'DiagnosticSignOk',
  'DiagnosticVirtualTextError', 'DiagnosticVirtualTextWarn',
})

describe_module('diff', {
  'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText',
})

describe('signet-nvim.groups (merged)', function()
  local groups = require('signet-nvim.groups')(palette)
  local names = {}
  for name in pairs(groups) do
    names[name] = true
  end

  it('merges every module without name collisions dropping groups', function()
    local editor = require('signet-nvim.groups.editor')(palette)
    local syntax = require('signet-nvim.groups.syntax')(palette)
    assert.is_not_nil(groups['Normal'], 'editor groups missing from merge')
    assert.is_not_nil(groups['Comment'], 'syntax groups missing from merge')
    assert.is_true(vim.tbl_count(editor) + vim.tbl_count(syntax) <= vim.tbl_count(groups))
  end)

  it('resolves every link to a group that exists in the merged set', function()
    helpers.assert_valid_groups(groups, colors, names)
  end)
end)
