# Graphviz.nvim

A very simple wrapper for [graphviz](https://graphviz.org/).

> [!NOTE]
> This plugin requires [graphviz](https://graphviz.org/)

## Installation

- **lazy.nvim**

```lua
{
    "izocha/graphviz.nvim",
    ft = { "dot" },
    config = true
}
```

## Configuration

```lua
require("graphviz").setup({
 format = "pdf", --default format for GraphExport
 preview = "pdf", --default format for GraphPreview
})
```

## Usage

> [!NOTE]
> Unfortunately, this plugin only works with the `dot` command.

The plugin has only two commands which are only available to files with the **.dot** and **.gv** file extensions.  
`Graphviz.nvim` uses `vim.notify` for error notifications on export.

- `GraphExport` can accept 1 argument for the format, but if no argument is provided, it will use the default **setup** value.

```vim
:GraphExport format
```

`GraphExport` only exports the actual file to preferred format.

- `GraphPreview` doesn't take arguments, but you can change the output format within the setup function.

```vim
:GraphPreview
```

`GraphPreview` also exports, but it works automatically whenever you save, so you don’t have to run the `GraphExport` command every time you want to see the results.
