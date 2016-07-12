# Aureola

Version : v1.1.7

Date : 12/07/2016

A collection of conky's I made myself and conky's I like that were shared with the community.

These conky's configuration files follow the LUA syntax as mentioned on the conky website for version 1.10 and later versions.

Conky's will be first tested and made on Linux Mint and then tested on other Os's.


# Installation of conky aureola

To get al these conky's to your computer, run the script

	- get-aureola-from-github-to-local-drive.sh


This script will take care of :

	- file management

	- making sure that conky starts next time you boot

	- making sure there is a ~/.config/conky folder present

	- making a hidden folder ~/.aureola where all the github files will reside

	- copy/pasting the github files in the hidden folder ~/.aureola


Aureola's home folder is a hidden one. 

	
	~/.aureola


Conky's home folder is also a hidden one.

	~/.config/conky.


Anything with the name <b>conky.conf</b> will be started if in the conky's home folder.



# Running a conky


Now you have a hidden folder on your computer with all the conky's of aureola.

Navigate to ~/.aureola  (or stay in your download folder)

and choose a directory of a conky you like.

Run the installation script provided :


	install-conky.sh


This script will provide the following steps :

	- making sure all folders are available
	- alerting if you want to overwrite the ~/.config/conky files
	- copy all files of that particular conky to ~/.config/conky
	- making sure you autostart conky next boot
	- install the fonts if they are missing - missing fonts just break the conky
	- checking dependancies and installing the extra software needed for this conky
	- and last but not least - run the conky


# Switching the conky

Every conky has an individual installation script. That means you will only install software that you need for the conky.

The script asks you  if it is ok to delete everything inside folder ~/.config/conky.

The reason I have done this is because you sometimes change the code on the live conky in ~/.config/conky but if you change the conky via this script the files will be overwritten. Then all your work is gone.

Respond with yes if you did not change anything.


	Exactly the same steps will be taken as above mentioned.


If there are dependancies (read software) that is required for the conky to function fully,
it will be installed.


# Spotify

Whether you install spotify or not is left up to the user. Follow this link and follow the steps

	https://www.spotify.com/nl/download/linux/



# OVERVIEW OF THE CURRENT COLLECTION

The most recent conky comes first.


# Aureola - Netsense

This conky came from the need to know my network information and current downloads via transmission torrents.

The conky works with the program transmission-cli (command line interface). It will be installed during the installation script. 

After changing the settings in Edit, Preferences, Remote and allowing remote access only to your personal pc aka 127.0.0.1, you can see the current status of your torrent downloads in the conky.

DO NOT FORGET TO DO THIS!

![Screenshots](http://i.imgur.com/GnExWlW.png)

If transmission is not downloading anything (or uploading), you will get this message.

![Screenshots](http://i.imgur.com/o6hRerL.png)

If the download is idle, you will see this message.

![Screenshots](http://i.imgur.com/3A3EYum.png)

If the download has started, you will see this message.

Green means you are downloading. Check out the percentage.

![Screenshots](http://i.imgur.com/4n9aVUD.png)

The download is further along. Check out the percentage.

ETA = Estimated Time of Arrival

![Screenshots](http://i.imgur.com/OlBgxAz.png)

If you stop the download for some reason, you will get this message.

![Screenshots](http://i.imgur.com/QVbDBxy.png)



VERY IMPORTANT.


If you are seeding i.e. uploading then the color is red.

![Screenshots](http://i.imgur.com/nnLfm8u.png)


<b>Remark for Linux Mint 18 Mate.</b>

Change the conky.conf file at the bottom and change this line

	${if_running transmission-gtk}${color1}#

to

	${if_running transmission-gt}${color1}#

Yes! The naming of the process is different.


# Aureola - Asura

A conky first seen from the hand of Jesse Avalos and changed to my needs and wishes.


![Screenshots](http://i.imgur.com/LEq7GwJ.png)


# Aureola - Acros

script to get the latest image for spotify and a logo for the distro


![Screenshots](http://i.imgur.com/pyZEPdf.png)



# Aureola - Salis

Working with a lua ring script. The explanation of Alva about eth0, eth1 etc applies here too. Check your system and change the lua.

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

This is the original conky from EtlesTeam still available in the folder lua.

This is the changed version that will activated standard for ethernet connection.

![Screenshots](http://i.imgur.com/77wMpId.png)


The original conky had wireless link quality and downspeed as bottom gauge.

Since I am working on a pc, I wanted my ethernet connection to show up.

If you want the original laptop conky back with wireless information then rename the rings_text-bg.lua to rings_text-bg-ethernet.lua. And change rings_text-bg-for-wireless.lua to rings_text-bg.lua. Check the name in the lua file for the name of your wireless card. Now it is named <b>wlx0015af414869</b>.

The ethernet conky (the one standard activated) uses <b>enp2s0</b> as ethernet name. It can me also eth0 or eth1 or something else. 

Find out with following command in a terminal

	ip link


For the lua conky I did a netspeed test and adapted my conky max for upspeed and downspeed accordingly.

downspeed 	= 191,19 Mbps  	- in conky 	-	190.000

Upspeed  	=  23,98 Mbps	- in conky 	-	22.000

<a href="http://www.speedtest.net/my-result/5467198314"><img src="http://www.speedtest.net/result/5467198314.png" /></a>






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