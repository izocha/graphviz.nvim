# Graphviz.nvim

A very simple wrapper for [graphviz](https://graphviz.org/). I hope this my first plugin helps someone.

> [!NOTE]
> This plugin require [graphviz](https://graphviz.org/)

## Installation

- **lazy.nvim**

```lua
{
    "izocha/graphviz.nvim",
    ft = {"dot"},
    config = true
}
```

**default config**

```lua
require("graphviz").setup({
    format = "pdf", --default format for GraphExport
    preview = "pdf" --default format for GraphPreview
})
```

## How to use

The plugin have two commands to play, but only works with **dot** and **gv** files.

- `GraphExport` can take 1 argument for format, but can take the default value of setup.

```vim
:GraphExport format
```
`GraphExport` notify users if something goes wrong on first time.

This command only convert the actual file to preferred format.

> [!WARNING]
> Unfortunately, this command ONLY notify user on first export.

- `GraphPreview` don't take arguments, but you can change the format in setup

```vim
GraphPreview
```

`GrapPreview` exports too, but it's a command that works similar but is automatic. This command exports on save!. So you don't need to run the command `GraphExport` every time you want to see results.

