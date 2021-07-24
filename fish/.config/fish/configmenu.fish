#!/bin/fish

set -l CHOICE (echo -n "$configs" | tr ' ' '\n' | sort | rofi -sep '\n' -dmenu -P "Config File")

if test -f "$CHOICE"
    $TERMINAL $EDITOR $CHOICE
end
