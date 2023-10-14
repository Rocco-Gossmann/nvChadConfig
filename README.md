# NvChad Custom Config

this config has a few changes compared to NvChads default, example config.

## Project specific configurations

You may create a `.nvim` folder inside any **working directory** you want.

within there, you can create (as of now) 3 files.

| file       | description                                                           |
| ---------- | --------------------------------------------------------------------- |
| `init.lua` | contains vim specific configurations                                  |
| `lsp.lua`  | to set up the (L)anguage-(S)erver-(P)rotocol for your Project         |
| `dap.lua`  | All your configurations for the (D)ebug-(A)dapter-(P)rotocol go here. |

## Project specific Language Server Settings

In addition to the `lsp.lua` you can also define configurations for any of the
preinstalled languageservers.

```
[LangaugeServerName].settings.lua
```

These are These have to return a Table with the `settings` for the Language
Server. The returned Settings get mixed into the existing default settings. (So
you you only have to change, what you need, not redefine everything).

| Language Server | File                    | Languages             |
| --------------- | ----------------------- | --------------------- |
| `gopls`         | `gopls.settings.lua`    | Go / GoLang           |
| `tsserver`      | `tsserver.settings.lua` | Javascript/Typescript |
| `html`          | `html.settings.lua`     | HTML                  |
| `cssls`         | `cssls.settings.lua`    | CSS                   |
| `clangd`        | `clangd.settings.lua`   | CLangd                |

Please refere to the `.nvim-example` folder in this repo.

### DAP configurations.

The Adapters are configured in this Repos `dap/adapters/init.lua`.

To install them I recommend Mason.\
To activate them / make them visible to DAP you need to define an executable
Adapter, you need to setup a minimal executable config using the Adapters-Name
you got from Mason as the command.

```lua
dap.adapters.chrome = {
    type = "executable",
    command = "chrome-debug-adapter",
}
```

### DAP configurations.

the "Launch" - configurations are defined on a per project basis again. See the
Project specific configuration section above. The go into the
`[projectroot]/.nvim/dap.lua` file

Here is an example, using the Adapter from above to open the Brave-Browser on
MacOS, and navigate to a remote servers URL when ever you are on a `html`,
`css`, or `javascript` file.

```lua
local dap = require("dap")

-- Setup a launch config for each of these 3 filetypes
local filetypes = { "javascript", "html", "css" }

for _, filetype in pairs(filetypes) do
	dap.configurations[filetype] = {
		{
			request = "launch",
			type = "chrome",
			url = "http://localhost:7353",
			webRoot = "${workspaceFolder}",
			runtimeExecutable = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser",
			userDataDir = true,
		},
	}
end
```

To start a Debug-Session just hit `<leader>ds`

## Telescope/Finder changes

| key          | effect                                         |
| ------------ | ---------------------------------------------- |
| `<leader>ff` | now follows symlinks                           |
| `<leader>fa` | now shows all Files in (including hidden once) |
| `<leader>fw` | disabled                                       |
| `<leader>fs` | does the live-grep instead                     |

## In Visual-Mode enhancements.

you can press one of the following keys to **surround** what is selected with
the following characters

| key     | surround         |
| ------- | ---------------- |
| `(`     | `(Selected)`     |
| `[`     | `[Selected]`     |
| `{`     | `{Selected}`     |
| `.`     | `.Selected.`     |
| `"`     | `"Selected"`     |
| `'`     | `'Selected'`     |
| `-`     | `-Selected-`     |
| `_`     | `_Selected_`     |
| `*`     | `*Selected*`     |
| `~`     | `~Selected~`     |
| `/`     | `Selected`       |
| `` ` `` | `` `Selected` `` |

so pressing `viw*/` on a word quickly wraps it into a block comment.\
`word` => `/*word*/`

Also works in Block-Select mode

With any text selected, you can press `<S-k>` or `<S-j>` to move selected lines
up and down.

at last, while in visual mode you can press `<C-r>` to bring up a quick
replacement command.

## Marker Changes

You can use `<leader>m0` to `<leader>m9` to set **global** marks in registers
`A` to `J`.

Pressing `m0` to `m9` will jump to these.

## Tmux Navigation

This Config uses TMUX-Navigation. Therefore navigating between splits is done
via `<C-h|j|k|l>`. If you set up your tmux to do the same, navigation between
TMUX and Vim is seemless.

## Quick Split creation

via `E h|j|k|l` you can create a new split in any of the 4 cardinal directions
from the current editor.

## Markdown Shortcuts
pressing the following sequences in Normale Mode will do:

| Sequence | Action                          |
| -------- | ------------------------------- |
| `qt`     | turn line into a Todo Task      |
| `qd`     | turn line into a done Todo Task |
| `qc`     | strike line                     |
| `qx`     | remove strike and Todo-checkbox |
