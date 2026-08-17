-- Pins signet's highlight groups to the exact palette key Token Dark itself
-- uses for that group (per lua/token/groups/*.lua upstream), so a future
-- edit can't silently drift the *mapping* even though tests/palette_spec.lua
-- already guarantees the *hex values* stay correct.
local palette = require('signet-nvim.palette')
local groups = require('signet-nvim.groups')(palette)

local function resolve(name, seen)
  local hl = groups[name]
  assert(hl, 'unknown group: ' .. name)
  if not hl.link then
    return hl
  end
  seen = seen or {}
  assert(not seen[name], 'link cycle at ' .. name)
  seen[name] = true
  return resolve(hl.link, seen)
end

--- Asserts group `name` resolves (following links) to palette[key] on `field`.
local function assert_field(name, field, key)
  local hl = resolve(name)
  assert.equals(palette[key], hl[field], name .. '.' .. field .. ' should resolve to palette.' .. key)
end

describe('Token Dark fidelity: group -> palette key mapping', function()
  it('syntax groups match Token Dark', function()
    assert_field('Comment', 'fg', 'fg2')
    assert_field('Constant', 'fg', 'purple')
    assert_field('Function', 'fg', 'accent')
    assert_field('Keyword', 'fg', 'accent2')
    assert_field('Statement', 'fg', 'accent2')
    assert_field('Exception', 'fg', 'red')
    assert_field('Type', 'fg', 'blue')
    assert_field('StorageClass', 'fg', 'accent2')
    assert_field('Special', 'fg', 'purple')
    assert_field('Tag', 'fg', 'purple')
    assert_field('PreProc', 'fg', 'purple')
  end)

  it('treesitter captures match Token Dark', function()
    assert_field('@variable.builtin', 'fg', 'accent2')
    assert_field('@function.builtin', 'fg', 'accent')
    assert_field('@type.builtin', 'fg', 'blue')
    assert_field('@constructor', 'fg', 'blue')
    assert_field('@module', 'fg', 'blue')
    assert_field('@attribute', 'fg', 'purple')
    assert_field('@string.regexp', 'fg', 'purple')
    assert_field('@keyword.operator', 'fg', 'accent2')
    assert_field('@markup.heading', 'fg', 'accent')
  end)

  it('LSP semantic tokens link to the matching capture/syntax group', function()
    assert.equals('@type', groups['@lsp.type.class'].link)
    assert.equals('@function', groups['@lsp.type.function'].link)
    assert.equals('@variable', groups['@lsp.type.variable'].link)
    assert.equals('@module', groups['@lsp.type.namespace'].link)
  end)

  it('diagnostics match Token Dark', function()
    assert_field('DiagnosticError', 'fg', 'red')
    assert_field('DiagnosticWarn', 'fg', 'yellow')
    assert_field('DiagnosticInfo', 'fg', 'blue')
    assert_field('DiagnosticHint', 'fg', 'cyan')
    assert_field('DiagnosticOk', 'fg', 'green')
    assert.equals(palette.diff_add, groups['DiagnosticVirtualTextOk'].bg)
  end)

  it('diff groups match Token Dark (no DiffDelete foreground override)', function()
    assert.is_nil(groups['DiffDelete'].fg)
    assert_field('DiffDelete', 'bg', 'diff_del')
    assert_field('Added', 'fg', 'green')
    assert_field('Removed', 'fg', 'red')
  end)
end)
