# Aureola

Version : v1.0.7
Date : 08/07/2016

A collection of conky's I made myself and conky's I like that were shared with the community.

These conky's configuration files follow the LUA syntax as mentioned on the conky website for version 1.10 and later versions.

Conky's are will be first tested and made on Linux Mint and then tested on other Os's.


# Installation of conky

You can run a script to autoinstall all necessary items to let all conky's function fully.

	- conky-installation-vx.sh

The least you should do is install these in a terminal : 

	sudo apt-get install conky conky-all

I recommend you use also the conkymanager.

	sudo apt-get install conky-manager

But conky is changing its configuration file to lua syntax. That gives issues at this moment of writing (June 2016).


# Installation of Aureola conky collection

The Aureola conky itself can be installed via script too.

	- conky-aureola-vx.sh

It will download everything from github and copy it in a hidden folder (CTRL +H):

	./aureola

Then it will trigger one config file in particular so you can see it works.

The conky files 'HOME' folder is ./config/conky.

Anything in there will be started by conky.




# Switching the conky

Every conky has an installation script.

Two things will happen after conky has stopped.

	1. current info in ./config/conky will be deleted
	2. new conky files will be copied to ./config/conky 

Conky will restart with new conky.

# OVERVIEW OF THE CURRENT COLLECTION

The most recent conky come first



# Aureola - Acros

script to get the latest image for spotify and a logo for the distro


![Screenshots](http://i.imgur.com/pyZEPdf.png)



# Aureola - Salis

Working with a lua ring script

![Screenshots](http://i.imgur.com/VPBJ6uV.png)


# Aureola - Lazuli

After the creation of a new icon set i.e Sardi Mono Grey I adapted the colors to go with the icon design.
Sardi icons to be found at https://sourceforge.net/projects/sardi


![Screenshots](http://i.imgur.com/o2Dp2bH.png)



![Screenshots](http://i.imgur.com/2JLL5kl.png)






# Aureola - Sparki

![Screenshots](http://i.imgur.com/GU4ck3k.png)

Credits Willem O








# Aureola - Alva

At the moment of creating this collection I found out that conky had decided to follow the LUA syntax for their configuration files.

Adapted this conky so it is now compliant to the lua syntax. This has a LUA script that draws the rings etc.

![Screenshots](http://i.imgur.com/57QwNug.png)

Credits EtlesTeam






# Home of Conky

https://github.com/brndnmtthws/conky

Configuration Settings

https://github.com/brndnmtthws/conky/wiki/Configuration-Settings

Conky Variables (more as backup)

http://conky.sourceforge.net/variables.html




# Interesting links

http://u-scripts.blogspot.be/

http://crunchbang.org/forums/viewtopic.php?id=16909&p=1

http://crunchbang.org/forums/viewtopic.php?id=39997

http://thepeachyblog.blogspot.be/p/index-or-home-page.html