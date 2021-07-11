#!/bin/fish

# Determine relavant options
set OPTIONS Shutdown
set -a OPTIONS Restart
if test (cat /proc/cmdline | tr ' ' \n | grep resume=)
    set -a OPTIONS Hibernate
end

set -l CHOICE (echo $OPTIONS | rofi -sep ' ' -dmenu)
if test -z "$CHOICE"
    exit 
end

# Perform selected option
if test $CHOICE = Shutdown
    poweroff
else if test $CHOICE = Restart
    reboot
else if test $CHOICE = Hibernate
    systemctl hibernate
end
