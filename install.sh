#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="${DOTFILES_BACKUP_DIR:-$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)}"

core_packages=(
  home
  fastfetch
  fish
  kitty
  nvim
  ohmyposh
)

linux_packages=(
  bashrc
  btop
  gtk-3.0
  gtk-4.0
  hypr
  matugen
  ml4w
  ml4w-dotfiles-settings
  nwg-dock-hyprland
  qt6ct
  quickshell
  rofi
  sidepad
  swaync
  vim
  walker
  waybar
  waypaper
  wlogout
  xsettingsd
  zshrc
)

usage() {
  cat <<'EOF'
Usage: ./install.sh [core|linux|mac|all] [--dry-run]

Profiles:
  core   Portable shell/editor/terminal config.
  mac    Same as core. Good starting point for macOS.
  linux  Core plus ML4W/Hyprland desktop config.
  all    Same as linux.

Existing files are moved to ~/.dotfiles-backup/<timestamp>/ before links are made.
EOF
}

profile="${1:-core}"
dry_run=0
if [[ "${2:-}" == "--dry-run" || "${1:-}" == "--dry-run" ]]; then
  dry_run=1
  [[ "$profile" == "--dry-run" ]] && profile="core"
fi

case "$profile" in
  core|mac)
    packages=("${core_packages[@]}")
    ;;
  linux|all)
    packages=("${core_packages[@]}" "${linux_packages[@]}")
    ;;
  -h|--help|help)
    usage
    exit 0
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

run() {
  if [[ "$dry_run" == 1 ]]; then
    printf 'dry-run:'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

same_target() {
  local a="$1"
  local b="$2"
  [[ -e "$a" || -L "$a" ]] || return 1
  [[ "$(realpath -m "$a")" == "$(realpath -m "$b")" ]]
}

backup_path() {
  local dest="$1"
  local rel="${dest#"$HOME/"}"
  local backup="$backup_dir/$rel"
  run mkdir -p "$(dirname "$backup")"
  run mv "$dest" "$backup"
}

link_entry() {
  local src="$1"
  local rel="${src#"$repo_dir/$2/"}"
  local dest="$HOME/$rel"

  if same_target "$dest" "$src"; then
    return
  fi

  if [[ -d "$src" && ! -L "$src" && -d "$dest" && ! -L "$dest" ]]; then
    while IFS= read -r -d '' child; do
      link_entry "$child" "$2"
    done < <(find "$src" -mindepth 1 -maxdepth 1 -print0)
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    backup_path "$dest"
  fi

  run mkdir -p "$(dirname "$dest")"
  run ln -s "$src" "$dest"
}

for package in "${packages[@]}"; do
  package_dir="$repo_dir/$package"
  [[ -d "$package_dir" ]] || continue

  while IFS= read -r -d '' src; do
    link_entry "$src" "$package"
  done < <(find "$package_dir" -mindepth 1 -maxdepth 1 -print0)
done

echo "Installed profile: $profile"
if [[ "$dry_run" == 0 ]]; then
  echo "Backups, if any: $backup_dir"
fi
