# oil8.nvim — Neovim API & Highlight-Group Audit

**Baseline:** last repo edit `2024-10-30` (Neovim 0.10 era)
**Target:** `NVIM v0.13.0-dev-813+ge715122e4e` (installed nightly), stable reference 0.12.3
**Method:** every claim verified against the installed nightly's default highlight
table (`getcompletion` / `nvim_get_hl`) and its bundled runtime docs
(`news-0.11/0.12.txt`, `news.txt`, `deprecated.txt`, `syntax.txt`,
`treesitter.txt`, `lsp.txt`). Nothing here is from memory.

**Scope (agreed):** Neovim-owned groups only — `built-in/` files + treesitter
default `@`-captures + `@lsp.*` + the API in `init.lua`/`config.lua`. Third-party
integrations (leap, mini, neo-tree, indent-blankline, illuminate) were
deliberately excluded; they drift with their plugins, not with Neovim.

---

## 1. Outdated — things to change or remove

| Item | Where | Status | Recommended action |
|---|---|---|---|
| `@string.regex` | `integrations/treesitter.lua:56` | **Renamed** → `@string.regexp` is the canonical capture; `@string.regex` is no longer emitted by any query. | Move the color onto `@string.regexp` directly and delete `@string.regex` + the `@string.regexp → @string.regex` link (`:57`). Functionally still works today via the link, but it's a dead alias. |
| `@keyword.export` | `integrations/treesitter.lua:36` | **Removed** — folded into `@keyword.import` ("keywords for including or **exporting** modules", `treesitter.txt:424`). No query emits `@keyword.export` anymore. | Delete the line. Note: export keywords now resolve via `@keyword.import → Keyword → Statement` (oil8 themes `Statement`), so they render, just not as `@keyword.return`. If you want them styled like returns, you'd override `@keyword.import` (but that also catches imports). |
| `vim.fn.exists('syntax')` | `init.lua:42` | **Logic bug** (not version drift). `exists('syntax')` checks for a *variable* named `syntax` → always returns `0`. In Lua `0` is **truthy**, so `syntax reset` runs unconditionally — the opposite of the guard's intent. Verified: `exists('syntax')=0`, `exists('syntax_on')=1`, `exists(':syntax')=2`. | Use `if vim.g.syntax_on then` (or `if vim.fn.exists('syntax_on') == 1 then`). |

### Already correct — no action (informational)

These deprecations/removals landed since 0.10, and the repo is **already clean**:

- `hl-VertSplit` → deprecated for `hl-WinSeparator` (`deprecated.txt:274`). oil8 defines `WinSeparator`, not `VertSplit`. ✓
- `TermCursorNC` → **removed** in 0.11 (`news-0.11.txt:83`). oil8 never defined it. ✓
- `vim.highlight` → renamed to `vim.hl`. oil8 doesn't use it. ✓
- `nvim_get_hl_by_name/id`, `nvim_buf_add_highlight` → deprecated. oil8 only uses `nvim_set_hl`, which is current. ✓

### Cosmetic only — not bugs

Highlight group names are **case-insensitive** in Neovim (verified: setting
`Preproc` writes `PreProc`; `PmenuSBar` writes `PmenuSbar`). So these work fine;
align casing only if you want to match the docs:

- `Preproc` → canonical `PreProc` (`syntax.lua:21`, and the `@keyword.directive` link `treesitter.lua:35`)
- `PmenuSBar` → canonical `PmenuSbar` (`ui.lua:31`)

---

## 2. Missing — recent Neovim additions (post-0.10, the "changes added")

These groups did not exist when you last edited. Default-link behavior is shown
because most inherit a group oil8 *already* themes (so they look on-theme even
unset — low urgency). "**off-palette**" marks the ones that need attention.

### Neovim 0.11

| Group | Default behavior | Priority |
|---|---|---|
| `PmenuMatch`, `PmenuMatchSel` | bold over `Pmenu` bg | low (themed) |
| `ComplMatchIns` | empty/transparent | low |
| `LspReferenceTarget` | → `LspReferenceText` → `Visual` (themed) | low |
| `StatusLineTerm`, `StatusLineTermNC` | → `StatusLine`/`StatusLineNC` (themed) | low |
| `DiagnosticVirtualLines{Error,Warn,Info,Hint,Ok}` | → `DiagnosticError…` (themed, except **Ok** — see §4) | low (Ok off-palette) |

### Neovim 0.12

| Group | Default behavior | Priority |
|---|---|---|
| `DiffTextAdd` | → `DiffText` (oil8 themes it) | low |
| `OkMsg` | **off-palette green** | **medium** — see §4 |
| `StderrMsg` | → `ErrorMsg` (themed) | low |
| `StdoutMsg` | empty | low |
| `SnippetTabstop` | → `Visual` (themed) | low |
| `SnippetTabstopActive` | → `SnippetTabstop` → `Visual` | low |
| `PmenuBorder` | → `Pmenu` (themed); for `'pumborder'` | low |
| `PmenuShadow`, `PmenuShadowThrough` | shadow under float popups | low |

### Neovim 0.13-dev

| Group | Default behavior | Priority |
|---|---|---|
| `Dimmed` | → `Comment` (themed) | low |
| `ComplHint`, `ComplHintMore` | completion inline hints | low |
| `PreInsert` | preinsert (built-in completion preview) | low |

*(0.13-dev groups may still change before release; re-check at 0.13 stable.)*

---

## 3. Missing — long-standing groups oil8 never styled (≤0.10)

Not "new Neovim changes," but real gaps. All link to themed groups unless noted,
so they're completeness items, not breakage.

- **Pmenu family:** `PmenuKind`, `PmenuKindSel`, `PmenuExtra`, `PmenuExtraSel` (→ `Pmenu`)
- **Messages:** `MsgArea` (empty → inherits `Normal`), `MsgSeparator` (→ `StatusLine`)
- **Float:** `FloatTitle` (→ `Title`)
- **Tabline:** `TabLine` (→ `StatusLineNC`), `TabLineFill` (→ `TabLine`) — note oil8 styles only `TabLineSel`
- **Buffer/window:** `EndOfBuffer` (→ `NonText`), `NormalNC` (empty → `Normal`)
- **LSP base:** `LspReferenceText/Read/Write` (→ `Visual`), `LspInlayHint` (→ `NonText`), `LspCodeLens`, `LspCodeLensSeparator`, `LspSignatureActiveParameter`
- **`@lsp.*` semantic tokens:** oil8 has no LSP groups file. By default `@lsp.*`
  are unset and fall through to treesitter/syntax — this is the common, valid
  choice, so leaving them is acceptable. Listed for completeness since they're
  in scope.

---

## 4. The one genuinely off-theme gap: the "Ok" diagnostic severity

`vim.diagnostic` gained an `OK`/`HINT`-style **Ok** severity (≤0.10). oil8 styles
`Error/Hint/Info/Warn` but never `Ok`, so these fall back to Neovim's hardcoded
green, which is **not in oil8's palette** and will clash:

- `DiagnosticOk` → `{ fg = #b3f000-ish green }` (standalone, off-palette)
- `DiagnosticUnderlineOk`, `DiagnosticVirtualTextOk`, `DiagnosticSignOk`, `DiagnosticFloatingOk`, `DiagnosticVirtualLinesOk` → all chain back to `DiagnosticOk`
- `OkMsg` (0.12) → same off-palette green

Also off-palette: `DiagnosticDeprecated` (hardcoded strikethrough `sp`) and
`DiagnosticUnnecessary` (→ `Comment`, themed — fine).

**Recommendation:** add `DiagnosticOk` (e.g. one of the palette greens —
`mantis`/`green_ryb`/`acid_green`) and its `DiagnosticUnderlineOk`; optionally
`DiagnosticDeprecated`. That closes the only visible palette leak from the
diagnostic family.

---

## 5. API audit (`init.lua`, `config.lua`)

| Call | Verdict |
|---|---|
| `vim.api.nvim_set_hl(0, name, args)` | Current. Not deprecated. ✓ |
| `vim.opt.termguicolors:get()` / `vim.opt.background:get()` | Work, but verbose; `vim.o.termguicolors` / `vim.o.background` read cleaner. Optional. |
| `vim.cmd('hi clear')`, `vim.g.colors_name = 'oil8'` | Current colorscheme idiom. ✓ |
| `vim.fn.exists('syntax')` | **Bug — see §1.** |
| `vim.tbl_deep_extend('keep', …)` | Current. ✓ |
| `vim.g[var] = color` (terminal colors) | Current. ✓ |
| `vim.notify(msg, level, {})` | Current. ✓ |

No deprecated API is in use. The only API-side issue is the `exists('syntax')`
guard in §1.

---

## Priority summary

1. **Fix** `exists('syntax')` guard (§1) — real bug, trivial fix.
2. **Clean** `@string.regex` → `@string.regexp` and drop `@keyword.export` (§1) — outdated treesitter captures.
3. **Add** `DiagnosticOk` (+`DiagnosticUnderlineOk`), optionally `OkMsg`/`DiagnosticDeprecated` (§4) — only off-palette leak.
4. **Optional polish:** style the new 0.11–0.13 groups in §2 and the long-standing gaps in §3 for a fully bespoke look; all currently inherit on-theme colors, so this is cosmetic completeness, not breakage.
