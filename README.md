# signet.nvim

A small, dark, warm-and-muted Neovim colorscheme.

## Features

- **One appearance, done well** — a single dark palette, no light variant, no configuration surface to reason about
- **Full coverage** — editor UI, legacy syntax groups, Treesitter captures, LSP semantic tokens, diagnostics, and diff highlights
- **Terminal colors included** — `:terminal` gets a matching 16-color palette automatically
- **Plugin-friendly** — sets the standard groups (`Comment`, `Title`, `Special`, `DiagnosticOk/Warn/Error/Info`, ...) that plugins commonly link their own highlights to

## Requirements

- Neovim 0.10+ (uses `vim.api.nvim_set_hl` and the `DiagnosticOk` highlight group)

## Installation

### lazy.nvim

```lua
{
  'Symphon-y/signet.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('signet')
  end,
}
```

### Verify

```
:colorscheme signet
```

If highlights don't look right, run `:checkhealth` and confirm `termguicolors` is enabled (`:set termguicolors`).

## Usage

```
:colorscheme signet
```

That's it — no `setup()` call is required or currently supported. There are no configuration options; if you need one, open an issue or a PR.

## How it works

`colors/signet.lua` calls `require('signet-nvim').load()`, which:

1. Clears any previously active colorscheme's highlights
2. Builds the full set of highlight groups from `lua/signet-nvim/palette.lua` (colors) and `lua/signet-nvim/groups/*.lua` (editor, syntax, Treesitter, LSP, diagnostics, diff — merged by `groups/init.lua`)
3. Applies them with `vim.api.nvim_set_hl`
4. Sets `g:terminal_color_0`–`15` from the same palette

### Palette

| Role | Color |
|---|---|
| Background | `#191918` → `#383835` (`bg0`–`bg5`) |
| Foreground | `#e8e4dc` → `#5a5955` (`fg0`–`fg3`) |
| Accent | `#d97757` |
| Red / Green / Yellow / Blue / Purple / Cyan / Orange | `#c67777` / `#7da47a` / `#c4a855` / `#7b9ebd` / `#a68bbf` / `#6ba8a8` / `#d4914a` |

## Development

```
make test
```

Runs the [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)-based spec suite headlessly (vendored into `.deps/` on first run). Every module — palette, each `groups/*.lua` file, the merged group table, `init.lua`'s `load()`, and the `:colorscheme signet` entry point — has its own spec; `tests/plugin_links_spec.lua` additionally guards that the groups this repo's other plugins (`whiteboard.nvim`, `gitdiff.nvim`, `cartograph.nvim`) link against stay populated.
