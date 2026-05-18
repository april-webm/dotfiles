# April's dotfiles

Portable config captured from the current CachyOS/ML4W system.

## Install

Preview links first:

```sh
./install.sh core --dry-run
```

Install the portable setup:

```sh
./install.sh core
```

Install on macOS:

```sh
./install.sh mac
```

Install the full CachyOS/ML4W desktop setup:

```sh
./install.sh linux
```

Existing files are moved into `~/.dotfiles-backup/<timestamp>/` before symlinks are created.

## Profiles

`core` and `mac` install the reusable pieces:

- Fish
- Git config
- Kitty, including the current fixed `colors-matugen.conf`
- Neovim
- Fastfetch
- Oh My Posh

`linux` also installs the ML4W/Hyprland desktop config:

- Hyprland, Waybar, Rofi, SwayNC, Wlogout, Walker
- ML4W settings, Matugen templates, GTK/QT config
- Quickshell and related ML4W desktop helpers

## Notes

The Kitty colours are intentionally checked in as a fixed generated file, so the terminal theme can be reused on macOS without ML4W or Matugen.

Fish universal variables (`fish_variables*`) are not tracked because they include machine-specific paths and runtime state.
