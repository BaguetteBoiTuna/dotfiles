#!/usr/bin/env bash
# Pre-render images into ANSI cache for Neovim dashboard

IMG_DIR="$HOME/.config/nvim/images"
CACHE_DIR="$HOME/.config/nvim/chafa_cache"

mkdir -p "$CACHE_DIR"

for f in "$IMG_DIR"/*; do
  [ -f "$f" ] || continue
  bn="$(basename "$f")"
  echo "Rendering $bn..."
  chafa "$f" --format symbols --symbols vhalf --size 60x17 --stretch >"$CACHE_DIR/${bn}.ans"
done

echo "✅ Chafa cache built at $CACHE_DIR"
