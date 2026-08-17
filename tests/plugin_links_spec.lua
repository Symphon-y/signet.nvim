local signet = require('signet-nvim')

-- Groups the user's existing plugin suite already links its own highlight
-- groups to (whiteboard.nvim, gitdiff.nvim, cartograph.nvim all call
-- vim.api.nvim_set_hl(0, name, { link = target, default = true }) against
-- these). If any of these fail to resolve, that suite loses its colors.
local required_targets = {
  'Comment', 'Title', 'Special',
  'DiagnosticOk', 'DiagnosticWarn', 'DiagnosticError', 'DiagnosticInfo',
}

describe('signet compatibility with the user plugin suite', function()
  before_each(function()
    vim.g.colors_name = nil
    pcall(vim.cmd, 'highlight clear')
    signet.load()
  end)

  for _, name in ipairs(required_targets) do
    it(name .. ' resolves to a non-empty highlight', function()
      local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
      assert.truthy(next(hl), name .. ' resolved to an empty highlight definition')
    end)
  end

  it('a plugin-style default link onto our groups still resolves', function()
    vim.api.nvim_set_hl(0, 'WhiteboardStatusOk', { link = 'DiagnosticOk', default = true })
    local hl = vim.api.nvim_get_hl(0, { name = 'WhiteboardStatusOk' })
    assert.truthy(next(hl))
  end)
end)
