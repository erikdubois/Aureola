#!/bin/sh

# this little batch file will autostart conky
# and copy the configuration file to the standard place
# where conky looks for a configuration file
# Lua syntax!!

# killing whatever conkies are still working
killall conky
sleep 1

# deleting whatever is still in ~/.config/conky/

read -p "Everything in folder ~/.config/conky/ will be deleted. Sure? (y/n)?" choice
case "$choice" in 
  y|Y ) rm -r ~/.config/conky/*;;
  n|N ) echo "Nothing has changed.";;
  * ) echo "Invalid input.";;
esac


# the standard place conky looks for a config file
cp conky.conf ~/.config/conky/conky.conf
# making sure conky is started at boo
cp start-conky.desktop ~/.config/autostart/start-conky.desktop

#starting the conky again
conky -c ~/.config/conky/conky.conf