#!/bin/sh

# this little batch file will autostart conky
# and copy the configuration file to the standard place
# where conky looks for a configuration file
# Lua syntax!!

# the standard place conky looks for a config file
cp conky.conf ~/.config/conky/conky.conf
# making sure conky is started at boo
cp start-conky.desktop ~/.config/autostart/start-conky.desktop
cp -r lua ~/.config/conky
