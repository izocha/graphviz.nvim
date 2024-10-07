# Graphviz.nvim

A very simple wrapper for [graphviz](https://graphviz.org/). I hope my first plugin helps someone.

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

- **default config**

```lua
require("graphviz").setup({
 format = "pdf", --default format for GraphExport
 preview = "pdf", --default format for GraphPreview
})
```

## How to use

> [!NOTE]
> Unfortunately, this plugin only works with `dot` command.

The plugin have two commands to play. These commands are only visible on **dot** and **gv** files.
`Graphviz.nvim` use `vim.notify` for error notifications on export.

- `GraphExport` can accept 1 argument for the format, but if no argument is provided, it will use the default **setup** value.

```vim
:GraphExport format
```

`GraphExport` only export the actual file to preferred format.

- `GraphPreview` don't take arguments, but you can change the format in setup

```vim
:GraphPreview
```

`GraphPreview` also exports, but it works automatically. It exports whenever you save, so you don’t have to run the `GraphExport` command every time you want to see the results.
