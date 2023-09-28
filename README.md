# NvChad Custom Config

this config has a few changes compared to NvChads default, example config.

## Project specific configurations

You may create a `.nvim` folder inside any **working directory** you want.

within there, you can create (as of now) 2 files.

| file |  description |
|-|-|
|`init.lua` | contains vim specific configurations |
|`lsp.lua`  | to set up the (L)anguage-(S)erver-(P)rotocol for your Project |

Please refere to the `.nvim-example` folder in this repo.


## Telescope/Finder changes
| key | effect |
|-|-|
| `<leader>ff` | now follows symlinks and shows hidden files shows hidden files |
| `<leader>fw` | disabled |
| `<leader>fs` | does the live-grep instead |

## In Visual-Mode enhancements.
you can press one of the following keys to **surround** what is selected with the following characters

| key | surround |
|-|-|
| `(` | `(Selected)` |
| `[` | `[Selected]` |
| `{` | `{Selected}` |
| `.` | `.Selected.` |
| `"` | `"Selected"` |
| `'` | `'Selected'` |
| `-` | `-Selected-` |
| `_` | `_Selected_` |
| `*` | `*Selected*` |
| `~` | `~Selected~` |
| `/` | `/Selected/` |

so pressing `viw*/` on a word quickly wraps it into a block comment.  
`word` => `/*word*/`  

Also works in Block-Select mode

With any text selected, you can press `<S-k>` or `<S-j>` to move selected lines up and down.

at last, while in visual mode you can press `<C-r>` to bring up a quick replacement command.

## Marker Changes
You can use `<leader>m0` to `<leader>m9` to set **global** marks in registers `A` to `J`.

Pressing `m0` to `m9` will jump to these.

## Tmux Navigation
This Config uses TMUX-Navigation. 
Therefore navigating between splits is done via `<C-h|j|k|l>`.
If you set up your tmux to do the same, navigation between TMUX and Vim is seemless.

## Quick Split creation
via `E h|j|k|l` you can create a new split in any of the 4 cardinal directions from the current editor.


