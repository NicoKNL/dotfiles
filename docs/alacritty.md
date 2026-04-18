# alacritty

Config at `alacritty/alacritty.toml`, symlinked to `~/.config/alacritty/alacritty.toml`.

## Settings

| Setting | Value | Notes |
|---------|-------|-------|
| Font family | `MesloLGS NF` | Nerd Font — required for prompt/tmux icons |
| Font size | 13.0 | |
| Window padding | 8px × 8px | Horizontal and vertical |
| Scroll history | 10 000 lines | |
| Shell | `/bin/zsh` | Explicit zsh, not the login default |

## Font

`MesloLGS NF` is a patched Nerd Font. Install via [Nerd Fonts](https://www.nerdfonts.com/) or:

```bash
brew install --cask font-meslo-lg-nerd-font
```
