local signet = require('signet-nvim')

describe('signet-nvim.load', function()
  before_each(function()
    vim.g.colors_name = nil
    pcall(vim.cmd, 'highlight clear')
  end)

  it('sets colors_name and background', function()
    signet.load()
    assert.equals('signet', vim.g.colors_name)
    assert.equals('dark', vim.o.background)
  end)

  it('applies palette-backed highlight groups', function()
    signet.load()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    assert.is_not_nil(normal.fg)
    assert.is_not_nil(normal.bg)
  end)

  it('sets all 16 terminal colors from the palette', function()
    signet.load()
    for i = 0, 15 do
      local value = vim.g['terminal_color_' .. i]
      assert.is_string(value, 'terminal_color_' .. i .. ' must be set')
      assert.truthy(value:match('^#%x%x%x%x%x%x$'))
    end
  end)

  it('can be called repeatedly without error', function()
    assert.has_no.errors(function()
      signet.load()
      signet.load()
    end)
  end)
end)
