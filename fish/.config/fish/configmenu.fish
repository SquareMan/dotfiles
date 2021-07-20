#!/bin/fish

set -l CHOICE (echo "$configs" | rofi -sep ' ' -dmenu)
$TERMINAL $EDITOR $CHOICE
