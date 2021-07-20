#!/bin/fish

set -l CHOICE (echo "$configs" | rofi -sep ' ' -dmenu -P "Config File")

if test -f "$CHOICE"
    $TERMINAL $EDITOR $CHOICE
end
