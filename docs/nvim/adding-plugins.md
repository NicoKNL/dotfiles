# Adding Plugins

Create a new file in `lua/plugins/yourplugin.lua`:

```lua
vim.pack.add({ "https://github.com/author/plugin.git" })
local ok, plugin = pcall(require, "plugin-name")
if not ok then return end
plugin.setup({ ... })
```

Then add `require("plugins.yourplugin")` to `init.lua`.

Packages are stored in `~/.local/share/nvim/site/pack/`.
