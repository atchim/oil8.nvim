# 🛢️ Oil 8

Oil 8 is a [GUI][gui]-only dark color scheme for [Neovim][nvim] based on the
[Oil 6 color palette][oil-6].

## ⚠️ Requirements

Oil 8 only requires the [`'termguicolors'`]['termguicolors'] option to be set.

## ✨ Features

- Dark theme with base colors based on the [Oil 6 color palette][oil-6].
- Colors distributed throughout the spectrum.
- Similar colors have similar meanings.
- Integration with [nvim-treesitter] and
  [many other plugins](#-plugin-integration).

## 🚀 Usage

To load the color scheme with its default configuration, use the traditional
[`:colorscheme`][:colorscheme] command, as shown below.

```vim
:colorscheme oil8
```

To load the color scheme with custom configuration, use the `setup` function,
which takes a [`Oil8Config`](#oil8config) as its only argument. This function
is exemplified in the following Lua code snippet.

```lua
require('oil8').setup({
  -- Terminal color support is enabled by default. Set it to `false` to
  -- disable.
  term_colors = false,

  -- By default, most plugins have integration enabled. To disable all plugin
  -- integration, set the `integrations` field to `false`.
  integrations = {
    neo_tree = false, -- Disable integration for Neo-tree.
    treesitter = true, -- Ensure integration for nvim-treesitter.
    mini = false, -- Disable all integration for Mini plugins.
  },

  -- The palette colors can be overwritten with new values.
  palette = {
    eerie_black = '#100f26',
    bone = '#fcf990',
  },

  -- Specify a highlight source both returning a table with highlight
  -- definitions for groups, and also setting terminal color via variable.
  hl_src = function(config)
    -- Use the resolved color palette.
    local palette = config.palette

    -- Overwrite the terminal color 14.
    vim.g.terminal_color_14 = palette.middle_blue

    -- Return the highlight groups to overwrite or be added.
    return {
      Conditional = { fg = palette.persian_pink },
      MyHighlightGroup = { fg = palette.inchworm, bold = true },
    }
  end,
})
```

## 🧩 Plugin Integration

Oil 8 provides seamlessly theme integration for other plugins of the Neovim's
ecosystem. The integration is configured via the
[`integrations` field](#integrations) of the configuration table that may be
passed as argument for the `setup` function. The supported plugins are listed
below.

- [Illuminate][vim-illuminate]
- [Indent Blankline][indent-blankline.nvim]
- [Leap][leap.nvim]
- [Mini][mini.nvim]
  - [Indentscope][mini.indentscope]
- [Neo-tree][neo-tree.nvim]
- [nvim-treesitter]

## 🔧 Configuration

Oil 8 can be configured via a partial configuration table
([`Oil8Config`](#oil8config)), which is passed as argument to the
[`setup` function](#-usage). The partial configuration is then merged into a
resolved configuration [`Oil8ResolvedConfig`](#oil8resolvedconfig), meaning
that any omitted options/fields are filled with their respective defaults.
These configuration options/fields are explained below.

### `hl_src`

A `nil`-by-default optional field for specifying a
[`Oil8HighlightSource`](#oil8highlightsource). For examples of how to use it,
see [the `setup` function](#-usage),
[`Oil8HighlightGroups`](#oil8highlightgroups),
[`Oil8HighlightSourceFn`](#oil8highlightsourcefn) and
[`Oil8HighlightSource`](#oil8highlightsource).

### `integrations`

An optional table for enabling or disabling Oil 8 integration with other
plugins. Set it to `false` to completely disable plugin integration.

Each field corresponds to a specific plugin or a set of related plugins. If a
field represents a single plugin, its value can be either `true` (to enable
integration) or `false` (to disable it). For fields representing a set of
plugins, the value can be a table nesting its related plugin fields, or `false`
to disable the integration for that entire set.

The following table outlines each available plugin integration, including the
field names, associated plugins, expected types, and their default values.

| Field              | Plugin                | Type           | Default Value |
|--------------------|-----------------------|----------------|---------------|
| `illuminate`       | [vim-illuminate]      | `boolean`      | `true`        |
| `indent_blankline` | [indent-blankline.nvim] | `boolean`    | `true`        |
| `leap`             | [leap.nvim]           | `boolean`      | `true`        |
| `mini`          | [mini.nvim] | `table \| false` | `{ indentscope = true }` |
| `mini`.`indentscope` | [mini.indentscope]  | `boolean`      | `true`        |
| `neo_tree`         | [neo-tree.nvim]       | `boolean`      | `true`        |
| `treesitter`       | [nvim-treesitter]     | `boolean`      | `true`        |

### `palette`

An optional partial version [`Oil8Palette`](#oil8palette), which may be used to
overwrite the default value of the [palette colors](#-palette).

### `term_colors`

An optional Boolean determining whether Oil 8 should set
[terminal color variables][terminal-config]. It defaults to `true`.

## 🏷️ Types

> [!NOTE]
> This documentation does not cover all available types. For a complete
> overview, please refer to the source code for detailed definitions and
> additional context.

### `Oil8Palette`

A key-value table representing the palette color names and their respective
values. For more details, refer to [this](#-palette).

```lua
---@class oil8.palette.Palette
---@field eerie_black string
---@field dark_gunmetal string
---@field space_cadet string
---@field cyber_grape string
---@field antique_fuchsia string
---@field burnished_brown string
---@field ecru string
---@field bone string
---@field caput_mortuum string
---@field english_red string
---@field brink_pink string
---@field tulip string
---@field dark_lava string
---@field dirty_brown string
---@field big_foot_feet string
---@field macaroni_and_cheese string
---@field bronze_yellow string
---@field acid_green string
---@field chinese_green string
---@field inchworm string
---@field kombu_green string
---@field green_ryb string
---@field mantis string
---@field medium_aquamarine string
---@field brunswick_green string
---@field jungle_green string
---@field turquoise string
---@field middle_blue string
---@field ateneo_blue string
---@field steel_blue string
---@field blue_jeans string
---@field baby_blue_eyes string
---@field pixie_powder string
---@field blue_pigment string
---@field violets_are_blue string
---@field mauve string
---@field japanese_violet string
---@field byzantine string
---@field light_deep_pink string
---@field persian_pink string

---@alias Oil8Palette oil8.palette.Palette
```

### `Oil8ResolvedConfig`

A table representing the configuration for the Oil 8 color scheme.

```lua
---@class oil8.config.Mini
---@field indentscope boolean

---@class oil8.config.Integrations
---@field illuminate boolean
---@field indent_blankline boolean
---@field leap boolean
---@field mini oil8.config.Mini | false
---@field neo_tree boolean
---@field treesitter boolean

---@class oil8.config.Config
---@field hl_src? Oil8HighlightSource
---@field integrations oil8.config.Integrations | false
---@field palette Oil8Palette
---@field term_colors boolean

---@alias Oil8ResolvedConfig oil8.config.Config
```

### `Oil8Config`

A partial version of [`Oil8ResolvedConfig`](#oil8resolvedconfig) (i.e., all
fields are optional).

```lua
---@class oil8.config.Mini.Partial
---@field indentscope? boolean

---@class oil8.config.Integrations.Partial
---@field illuminate? boolean
---@field indent_blankline? boolean
---@field leap? boolean
---@field mini? oil8.config.Mini.Partial | false
---@field neo_tree? boolean
---@field treesitter? boolean

---@class oil8.config.Config.Partial
---@field hl_src? Oil8HighlightSource
---@field integrations? oil8.config.Integrations.Partial | false
---@field palette? oil8.palette.Palette.Partial
---@field term_colors? boolean

---@alias Oil8Config oil8.config.Config.Partial
```

### `Oil8HighlightGroups`

```lua
---@class Oil8HighlightGroups: { [string]: vim.api.keyset.highlight }
```

A key-value table where (I) each key is a string representing a highlight group
name, and (II) each value is a table specifying the highlight attributes,
conforming with the `val` parameter of [`nvim_set_hl()`][nvim_set_hl()].

<details>
  <summary>Show/hide usage example.</summary>

  ```lua
  ---@type Oil8HighlightGroups
  local hl_groups = {
    Macro = { link = 'Function' },
    Type = { fg = '#966ef2', italic = true },
    Underlined = { underline = true },
    CustomGroup = { fg = '#fc83c5', bg = '#1c1b34', bold = true },
  }
  ```
</details>

### `Oil8HighlightSourceFn`

```lua
---@alias Oil8HighlightSourceFn fun(config: Oil8ResolvedConfig): Oil8HighlightSource?
```

An alias for a function that takes a [`resolved config`](#oil8resolvedconfig)
as input and returns an optional [highlight source](#oil8highlightsource).

<details>
  <summary>Show/hide usage example.</summary>

  ```lua
  local condition = true

  ---@type Oil8HighlightSourceFn
  local hl_src_fn = function(config)
    if not condition then
      return
    end

    local palette = config.palette
    return {
      Boolean = { fg = palette.persian_pink, bold = true },
      Foo = { fg = palette.bone, bg = palette.caput_mortuum },
    }
  end
  ```
</details>

### `Oil8HighlightSource`

```lua
---@alias Oil8HighlightSource Oil8HighlightGroups | Oil8HighlightSourceFn | Oil8HighlightSource[]
```

An alias for a type that can represent
[highlight groups (`Oil8HighlightGroups`)](#oil8highlightgroups), a
[highlight source function (`Oil8HighlightSourceFn`)](#oil8highlightsource), or
an array of `Oil8HighlightSource` items.

<details>
  <summary>Show/hide usage example.</summary>

  ```lua
  ---@type Oil8HighlightSource
  local hl_src_1 = { Float = { link = 'Number' } }

  ---@type Oil8HighlightSource
  local hl_src_2 = function(config)
    local palette = config.palette
    return { Dirty = { fg = palette.dirty_brown, bold = true } }
  end

  ---@type Oil8HighlightSource
  local hl_src_3 = { hl_src_1, hl_src_2 }
  ```
</details>

## 🎨 Palette

| Name                  | Hex       | HSL         | CIELAB       |
|-----------------------|-----------|-------------|--------------|
| `eerie_black`         | `#171629` | `243 30 12` | ` 8   6 -12` |
| `dark_gunmetal`       | `#1c1b34` | `242 31 15` | `11   8 -16` |
| `space_cadet`         | `#292449` | `248 33 21` | `16  13 -22` |
| `cyber_grape`         | `#5f4c73` | `269 20 37` | `35  16 -19` |
| `antique_fuchsia`     | `#8c607b` | `323 18 46` | `46  22  -7` |
| `burnished_brown`     | `#a77d72` | ` 12 23 55` | `56  14  12` |
| `ecru`                | `#bdab87` | ` 40 29 63` | `70   0  20` |
| `bone`                | `#e1e0c4` | ` 57 32 82` | `88  -4  13` |
| `caput_mortuum`       | `#622d2d` | `  0 37 28` | `25  23  11` |
| `english_red`         | `#aa3c55` | `346 47 45` | `41  47   9` |
| `brink_pink`          | `#f35e7c` | `347 86 66` | `60  59  13` |
| `tulip`               | `#fe7c8d` | `352 98 74` | `67  50  14` |
| `dark_lava`           | `#4b3a30` | ` 22 21 24` | `25   5   9` |
| `dirty_brown`         | `#b25c1f` | ` 24 70 40` | `48  30  48` |
| `big_foot_feet`       | `#f38f5e` | ` 19 86 66` | `69  33  42` |
| `macaroni_and_cheese` | `#fab98a` | ` 25 91 76` | `80  17  33` |
| `bronze_yellow`       | `#606c09` | ` 67 84 22` | `43 -16  46` |
| `acid_green`          | `#bbbd28` | ` 60 65 44` | `74 -17  68` |
| `chinese_green`       | `#d4e05c` | ` 65 68 61` | `86 -21  61` |
| `inchworm`            | `#bcec6a` | ` 82 77 67` | `87 -35  57` |
| `kombu_green`         | `#31452b` | `106 23 21` | `26 -13  13` |
| `green_ryb`           | `#4eb332` | `106 56 44` | `65 -52  54` |
| `mantis`              | `#72db5e` | `110 63 61` | `79 -53  51` |
| `medium_aquamarine`   | `#6ceaa7` | `148 75 67` | `84 -50  22` |
| `brunswick_green`     | `#1b5c4d` | `166 54 23` | `34 -24   2` |
| `jungle_green`        | `#2d9f84` | `165 55 40` | `58 -38   5` |
| `turquoise`           | `#58e9ca` | `167 76 62` | `84 -45   3` |
| `middle_blue`         | `#84cfdd` | `189 56 69` | `78 -19 -14` |
| `ateneo_blue`         | `#367ba6` | `203 50 43` | `49  -7 -29` |
| `steel_blue`          | `#024c67` | `196 96 20` | `29  -9 -21` |
| `blue_jeans`          | `#54b7e8` | `199 76 61` | `70 -14 -33` |
| `baby_blue_eyes`      | `#a4b6fe` | `228 97 81` | `75  10 -37` |
| `pixie_powder`        | `#3e2187` | `257 60 32` | `23  39 -52` |
| `blue_pigment`        | `#413aa1` | `244 47 42` | `31  33 -55` |
| `violets_are_blue`    | `#966ef2` | `258 83 69` | `56  44 -61` |
| `mauve`               | `#dd9ffe` | `278 98 80` | `74  39 -38` |
| `japanese_violet`     | `#592a5f` | `293 38 26` | `25  30 -22` |
| `byzantine`           | `#b22ab7` | `297 62 44` | `45  66 -45` |
| `light_deep_pink`     | `#e557cd` | `310 73 61` | `59  68 -33` |
| `persian_pink`        | `#fc83c5` | `327 95 75` | `70  53 -13` |

[:colorscheme]: https://neovim.io/doc/user/syntax.html#%3Acolorscheme
[gui]: https://neovim.io/doc/user/gui.html#gui
[indent-blankline.nvim]: https://github.com/lukas-reineke/indent-blankline.nvim
[leap.nvim]: https://github.com/ggandor/leap.nvim
[mini.indentscope]: https://github.com/echasnovski/mini.indentscope
[mini.nvim]: https://github.com/echasnovski/mini.nvim
[neo-tree.nvim]: https://github.com/nvim-neo-tree/neo-tree.nvim
[nvim]: https://neovim.io
[nvim_set_hl()]: https://neovim.io/doc/user/api.html#nvim_set_hl()
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[oil-6]: https://lospec.com/palette-list/oil-6
['termguicolors']: https://neovim.io/doc/user/options.html#'termguicolors'
[terminal-config]: https://neovim.io/doc/user/nvim_terminal_emulator.html#terminal-config
[vim-illuminate]: https://github.com/RRethy/vim-illuminate