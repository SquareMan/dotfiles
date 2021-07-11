#!/bin/fish

# Determine relavant options
set OPTIONS "Shutdown\nRestart"
if test (cat /proc/cmdline | tr ' ' \n | grep resume=)
    set OPTIONS "$OPTIONS"\\nHibernate
end

set -l CHOICE (echo -e $OPTIONS | rofi -dmenu)
if test -z "$CHOICE"
    exit 
end

# Perform selected option
if test "$CHOICE" = Shutdown
    poweroff
else if test "$CHOICE" = Restart
    reboot
else if test "$CHOICE" = Hibernate
    systemctl hibernate
end
