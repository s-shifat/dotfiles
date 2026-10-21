selection="$(slurp)" || exit 0
[ -n "$selection" ] || exit 0

directory="$HOME/Pictures/Screenshots"
mkdir -p "$directory"
file="$directory/$(date +%Y-%m-%d_%H-%M-%S_%N).png"

grim -g "$selection" "$file"
wl-copy --type image/png < "$file"
