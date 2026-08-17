local M = {}

-- Attribute keys nvim_set_hl / highlight tables may carry, besides fg/bg/sp/link.
local BOOLEAN_ATTRS = {
  bold = true, standout = true, underline = true, undercurl = true,
  underdouble = true, underdotted = true, underdashed = true,
  strikethrough = true, italic = true, reverse = true, nocombine = true,
  default = true, force = true,
}

-- Builds a lookup of every hex color value present in a palette table.
function M.color_set(p)
  local set = {}
  for _, hex in pairs(p) do
    set[hex] = true
  end
  return set
end

-- Asserts `groups` (name -> highlight-def table) only reference colors from
-- `valid_colors` (as produced by M.color_set) or 'NONE'. When `known_names`
-- is given, also asserts every `link` target exists in it — used once
-- individual modules are merged together and the full group set is known;
-- omit it to skip link-target resolution for a single module in isolation.
function M.assert_valid_groups(groups, valid_colors, known_names)
  for name, hl in pairs(groups) do
    assert(type(hl) == 'table', name .. ' must map to a table')

    if hl.link then
      assert(type(hl.link) == 'string', name .. '.link must be a string')
      if known_names then
        assert(known_names[hl.link] ~= nil, name .. ' links to unknown group: ' .. hl.link)
      end
    else
      for _, field in ipairs({ 'fg', 'bg', 'sp' }) do
        local value = hl[field]
        if value ~= nil and value ~= 'NONE' then
          assert(valid_colors[value], name .. '.' .. field .. ' is not a palette color: ' .. tostring(value))
        end
      end
    end

    for key, value in pairs(hl) do
      if key ~= 'fg' and key ~= 'bg' and key ~= 'sp' and key ~= 'link' then
        assert(BOOLEAN_ATTRS[key] ~= nil, name .. ' has unexpected attribute: ' .. key)
        assert(type(value) == 'boolean', name .. '.' .. key .. ' must be boolean')
      end
    end
  end
end

return M
