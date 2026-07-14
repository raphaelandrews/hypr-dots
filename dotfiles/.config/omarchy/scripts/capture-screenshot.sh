#!/bin/bash
[[ -f ~/.config/user-dirs.dirs ]] && source ~/.config/user-dirs.dirs
OUTPUT_DIR="${OMARCHY_SCREENSHOT_DIR:-${XDG_PICTURES_DIR:-$HOME/Pictures}}"

if [[ ! -d $OUTPUT_DIR ]]; then
  mkdir -p "$OUTPUT_DIR"
  notify-send "Created screenshot directory: $OUTPUT_DIR" -u normal -t 2000
fi

pkill slurp && exit 0

SCREENSHOT_EDITOR="${OMARCHY_SCREENSHOT_EDITOR:-satty}"

open_editor() {
  local filepath="$1"
  if [[ $SCREENSHOT_EDITOR == "satty" ]]; then
    satty --filename "$filepath" \
      --output-filename "$filepath" \
      --actions-on-enter save-to-clipboard \
      --save-after-copy \
      --copy-command 'wl-copy'
  else
    $SCREENSHOT_EDITOR "$filepath"
  fi
}

MODE="${1:-region}"
SELECTION=""
HYPRPICKER_PID=""

cleanup_freeze() {
  [[ -n $HYPRPICKER_PID ]] && kill $HYPRPICKER_PID 2>/dev/null
}
trap cleanup_freeze EXIT

case "$MODE" in
region)
  hyprpicker -r -z >/dev/null 2>&1 &
  HYPRPICKER_PID=$!
  sleep .1
  SELECTION=$(slurp 2>/dev/null)
  ;;
windows)
  hyprpicker -r -z >/dev/null 2>&1 &
  HYPRPICKER_PID=$!
  sleep .1
  RECTS=$(hyprctl monitors -j | jq -r '
    def format_geo:
      .x as $x | .y as $y |
      (.width / .scale | floor) as $w |
      (.height / .scale | floor) as $h |
      .transform as $t |
      if $t == 1 or $t == 3 then "\($x),\($y) \($h)x\($w)"
      else "\($x),\($y) \($w)x\($h)"
      end;
    .[] | select(.focused == true) | format_geo
  ')
  SELECTION=$(echo "$RECTS" | slurp -r 2>/dev/null)
  ;;
fullscreen)
  SELECTION=$(hyprctl monitors -j | jq -r '
    def format_geo:
      .x as $x | .y as $y |
      (.width / .scale | floor) as $w |
      (.height / .scale | floor) as $h |
      .transform as $t |
      if $t == 1 or $t == 3 then "\($x),\($y) \($h)x\($w)"
      else "\($x),\($y) \($w)x\($h)"
      end;
    .[] | select(.focused == true) | format_geo
  ')
  ;;
esac

[[ -z $SELECTION ]] && exit 0

FILENAME="screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
FILEPATH="$OUTPUT_DIR/$FILENAME"

grim -g "$SELECTION" "$FILEPATH" || exit 1

echo "file://$FILEPATH" | wl-copy --type text/uri-list

(
  ACTION=$(notify-send "Screenshot saved to clipboard and file" "$FILENAME" -t 10000 -i "$FILEPATH" -A "default=edit")
  [[ $ACTION == "default" ]] && open_editor "$FILEPATH"
) >/dev/null 2>&1 &
