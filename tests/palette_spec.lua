local palette = require('signet-nvim.palette')

local required_keys = {
  'bg0', 'bg1', 'bg2', 'bg3', 'bg4', 'bg5',
  'fg0', 'fg1', 'fg2', 'fg3',
  'accent', 'accent2',
  'blue', 'green', 'red', 'yellow', 'purple', 'cyan', 'orange', 'olive',
  'bright_green', 'bright_blue', 'bright_purple', 'bright_cyan',
  'diff_add', 'diff_del', 'diff_add_inline', 'diff_del_inline',
  'diff_add_strong', 'diff_del_strong', 'diff_change', 'diff_text',
  'diag_error', 'diag_warn', 'diag_info', 'diag_hint',
  'sel', 'match', 'indent', 'indent_active', 'line_nr',
  'gsign_add', 'gsign_change', 'gsign_del', 'gsign_untracked',
  'gsign_add_staged', 'gsign_change_staged', 'gsign_del_staged', 'gsign_untracked_staged',
}

describe('signet-nvim.palette', function()
  it('is a table', function()
    assert.is_table(palette)
  end)

  it('defines every required key', function()
    for _, key in ipairs(required_keys) do
      assert.is_not_nil(palette[key], 'missing palette key: ' .. key)
    end
  end)

  it('only contains valid #RRGGBB hex strings', function()
    for key, value in pairs(palette) do
      assert.is_string(value, key .. ' must be a string')
      assert.truthy(value:match('^#%x%x%x%x%x%x$'), key .. ' must be a #RRGGBB value, got ' .. tostring(value))
    end
  end)

  it('keeps distinct background steps', function()
    local seen = {}
    for _, key in ipairs({ 'bg0', 'bg1', 'bg2', 'bg3', 'bg4', 'bg5' }) do
      assert.is_nil(seen[palette[key]], key .. ' duplicates another bg step')
      seen[palette[key]] = key
    end
  end)
end)
