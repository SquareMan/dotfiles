#!/bin/fish

set -l CHOICE (echo "$configs" | rofi -sep ' ' -dmenu)

if test -f "$CHOICE"
    $TERMINAL $EDITOR $CHOICE
end
