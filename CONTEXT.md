# oil8.nvim

A GUI-only (`termguicolors`) dark colorscheme for Neovim. It maps Neovim
highlight groups to a fixed named color palette, organized so each group's
definition lives next to related groups.

## Language

**Highlight source**:
A unit that produces highlight-group definitions — either a table of groups, a
function returning such a table (given the resolved config), or a list of other
highlight sources. The recursive building block oil8 assembles to theme Neovim.
_Avoid_: hl table, group module. Type alias: `Oil8HighlightSource` / `hl_src`.

**Built-in group**:
A highlight group that Neovim core defines by default (e.g. `Normal`, `Pmenu`,
`DiagnosticError`). Lives under `groups/built-in/`.
_Avoid_: native group, core group (use "built-in").

**Integration group**:
A highlight group owned by a third-party plugin (treesitter, leap, mini,
neo-tree, indent-blankline, illuminate) that oil8 themes. Lives under
`groups/integrations/`. Drifts with the plugin, not with Neovim.
_Avoid_: plugin group, external group.

**Neovim-owned group**:
The subset of groups Neovim itself defines or standardizes: built-in groups plus
treesitter default `@`-captures and `@lsp.*` semantic tokens. This is the set
that changes with the Neovim version (the boundary for version-drift audits).
_Avoid_: standard group.

**Palette**:
oil8's fixed set of named colors (e.g. `turquoise`, `brink_pink`, `eerie_black`).
Every highlight references the palette rather than literal hex; user overrides
replace palette entries, not individual groups.
_Avoid_: theme, colors, scheme.
