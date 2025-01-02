#!/bin/bash
set -e
cd /etc/nixos/
# Autoformat your nix files
alejandra /etc/nixos/ &>/dev/null \
  || ( alejandra /etc/nixos/ ; echo "formatting failed!" && exit 1)

notify-send "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
sudo nix flake upgrade
nh os switch


# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)

git add *
git commit -am "$current"
sudo git push
notify-send "Rebuild finished"
# Commit all changes witih the generation metadata
