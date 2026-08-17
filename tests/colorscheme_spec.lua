describe(':colorscheme signet', function()
  it('loads via the standard colorscheme command', function()
    vim.g.colors_name = nil
    pcall(vim.cmd, 'highlight clear')

    vim.cmd.colorscheme('signet')

    assert.equals('signet', vim.g.colors_name)
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    assert.is_not_nil(normal.fg)
  end)
end)
