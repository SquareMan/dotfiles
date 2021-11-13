#!/bin/fish

# Determine relevant options
set OPTIONS "Shutdown\nRestart"
if test (cat /proc/cmdline | tr ' ' \n | grep resume=)
    set OPTIONS "$OPTIONS"\\nHibernate
end
set OPTIONS "$OPTIONS"\\nSuspend\\nLogout

set -l CHOICE (echo -e $OPTIONS | rofi -dmenu -p Power)
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
else if test "$CHOICE" = Suspend
    systemctl suspend
else if test "$CHOICE" = Logout
    i3-msg exit
end
