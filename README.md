# Aureola

Version : v2.0.3

Date : 27/01/2018

A collection of conky's I made myself and conky's I like that were shared with the community.

These conky's configuration files follow the **LUA** syntax as mentioned on the conky website for **version 1.10** and later versions.

Conky's will be first tested and made on Linux Mint Cinnamon and then tested on other Os's.


# Installation of conky collection aureola

Youtube tutorial with Aureola Skeleton as example

https://www.youtube.com/watch?v=7M_nkznxopQ


To get all these conky's to your computer you can either download the zip and uncompress it or use a terminal and type

		git clone https://github.com/erikdubois/Aureola

Open the folder and run the script

		./get-aureola-from-github-to-local-drive.sh

This script will again download the latest code from github but it will also move all the conky's
in a hidden folder in your home directory. All the conky's will be placed in

		~/.aureola

From this folder .aureola you can rerun at any time the script

		./get-aureola-from-github-to-local-drive.sh

and your conky's will be **updated to the latest version automatically**.

This script will take care of :

	- file management

	- making sure that conky starts next time you boot

	- making sure there is a ~/.config/conky folder present

	- making a hidden folder ~/.aureola where all the conky's will reside

	- copy/pasting the github files in the hidden folder ~/.aureola



# Remember

Aureola's home folder is a hidden one.

	~/.aureola

Conky's home folder is also a hidden one.

	~/.config/conky.

Anything with the name **conky.conf** will be started if in the conky's home folder.



# Choose and run a conky

Now you have a hidden folder on your computer with all the conky's of aureola.

**Navigate to ~/.aureola**

and choose a directory of a conky you like. There are images available.

Run the installation script provided :

	./install-conky.sh

This script will provide the following elements :

	- making sure all folders are available
	- alerting if you want to overwrite the ~/.config/conky files
	- copy all files of that particular conky to ~/.config/conky
	- making sure you autostart conky next boot
	- install the fonts if they are missing - missing fonts just break the conky
	- checking dependencies and installing the extra software needed for this conky
	- and last but not least - run the conky



# Switching the conky

Every conky has an **individual installation script**. That means you will only install software that you need for the conky.

			./install-conky.sh

The script asks you  if it is ok to delete everything inside folder **~/.config/conky**.

The reason I have done this is because you sometimes change the code on the **live conky** in **~/.config/conky** but if you change the conky via this script the files will be *overwritten*. Then all your work is gone.

Respond with *yes* if you did not change anything.

>The script will follow exactly the same steps as above mentioned.

If there are dependencies (read software) that is required for the conky to function fully,
it will be installed.


# Spotify

Whether you install spotify or not is left up to the user. Follow this link and follow the steps

https://www.spotify.com/nl/download/linux/


# Dual-screen users

use the following code in your config file

	xinerama_head = 3,  						-- for dual screen

You can use other integers 1,2,3.

3 was the solution for me.



# OVERVIEW OF THE CURRENT COLLECTION

The most recent conky comes first.


# Aureola - ULM

ULM or Ultimate Linux Mint


Scripts on https://github.com/erikdubois/Ultimate-Linux-Mint-18.2-Cinnamon

![Screenshots](http://i.imgur.com/7fhqO7T.jpg)


# Aureola - Logo

![Screenshots](http://i.imgur.com/bxmV2rB.jpg)


# Aureola - Phantom

![Screenshots](http://i.imgur.com/bOhpjPO.jpg)


# Aureola - Spotter

![Screenshots](http://i.imgur.com/C5AnUaC.jpg)


# Aureola - Shailen MC

MC = Media Center

Use of bigger fonts to be viewed on hd tv

![Screenshots](http://i.imgur.com/nOEsL6A.jpg)


# Aureola - Shailen


![Screenshots](http://i.imgur.com/mHqVHAY.png)


# Aureola - Cherry


![Screenshots](http://i.imgur.com/8GoU1mm.jpg)


# Aureola - Skeleton


Youtube tutorial with Aureola Skeleton as example

https://www.youtube.com/watch?v=7M_nkznxopQ


![Screenshots](http://i.imgur.com/uhJxSD7.jpg)



# Aureola - Poku

This conky is based on Unix-on from Etles_Team.
Changed it around a bit to suit my needs.

![Screenshots](http://i.imgur.com/75ZPMkz.jpg)


# Aureola - Gambodekdue

This conky is based on the Gambodekuno. I deleted the date and time from Gambodekmono. We have it usually somewhere in our panel and changed some items around in order to have dropbox and its text when it syncs.


<b>Naming</b>

Naming is similar as gambodekuno.

Gambo is leg. Dek is ten and due is two. So 12 legs.


<b>Specifications</b>

Specifications are the same as Gambodekuno  +  Dropbox.


<b>Examples</b>

WHITE version via settings file

![Screenshots](http://i.imgur.com/uIwlajW.jpg)

DARK version via settings file

![Screenshots](http://i.imgur.com/u8p0e64.png)

Text from spotify and dropbox comes from conky.conf. You can change the colour there if you want.
Logo can be changed if you so like to do in the main.lua file.

If you do not like the black transparant look in the background, change these lines in the conky.config file

	own_window_argb_value = 150,

to

	own_window_argb_value = 0,

![Screenshots](http://i.imgur.com/3cDjzEY.png)

Beware!

The other swirly lines are from the wallpaper which is actually perfect for this conky.

If you just installed <b>vnstat</b> for the first time, you will not have enough date to display information. After a few hours the database gets populated and it will show up under the IP leg.


# Aureola - Gambodekuno

This is an old conky (octupi) from akshendra. https://github.com/akshendra/octupi-conky. It is mostly written in Lua and was and is a great exercise to learn more of the lua syntax. I have been adding arms to the conky like spotify and others.

It is particularly interesting if you have a dual screen.

<b>Naming</b>

Gambodekuno stands for something.

Gambo stands for legs.

Dek is ten and uno is one.

So 11 legs.

<b>Specifications</b>

	- Coloring of the circles for several items like cpu, disk i/o.
	- Temperature of your cpu
	- If you put in your login and pasword in a file, you will see how many unread mails you have.
	- ip adress
	- speed of up and download
	- usage of network today, month, total
	- cpu usage
	- cpu top 10 processes
	- swap use in percentage
	- spotify - title, album and picture
	- uptime of computer
	- Home free and total in GB
	- Disk i/o speed
	- Ram usage in percentage
	- Top processes that are using the most memory
	- Power - only on a laptop
	- White and black color scheme available.
	- logo's of distro's are available and easy expandable by the user

<b>Examples</b>

WHITE version via settings file

![Screenshots](http://i.imgur.com/Na9alhS.png)

DARK version via settings file

![Screenshots](http://i.imgur.com/sygVLkl.png)

Text from spotify and dropbox comes from conky.conf. You can change the colour there if you want.
Logo can be changed if you so like to do in the main.lua file.

If you do not like the black transparant look in the background, change these lines in the conky.config file

	own_window_argb_value = 150,

to

	own_window_argb_value = 0,

![Screenshots](http://i.imgur.com/fpyOBM5.png)

If you just installed <b>vnstat</b> for the first time, you will not have enough date to display information. After a few hours the database gets populated and it will show up under the IP leg.

Some of the icons can change their colour if cpu > 20 or >40 etc.

Here is a picture where the DISK I/O changes colour. You can edit the levels and the colours in the lua.

![Screenshots](http://i.imgur.com/dmHqCYt.png)



# Aureola - Netsense

This conky came from the need to know my network information and current downloads via transmission torrents.

![Screenshots](http://i.imgur.com/LH6oerv.jpg)

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



Icons from Sardi on Sourceforge - wallpaper provided by variety

![Screenshots](http://i.imgur.com/3l0tG2d.jpg)


# Aureola - Acros

Included a script to get the latest image for spotify and a logo for the distro.

Not all distro's have the command aptitude. Delete the line if you do not have this.

In Ubuntu Mate 16.04 or Ubuntu 16.04 you can install aptitude via

	sudo apt-get install aptitude


![Screenshots](http://i.imgur.com/tCxdkQJ.jpg)




# Aureola - Salis

Working with a lua ring script. The explanation of Alva about eth0, eth1 etc applies here too. Check your system and change the lua.

![Screenshots](http://i.imgur.com/VPBJ6uV.png)





# Aureola - Lazuli

After the creation of a new icon set i.e Sardi Mono Grey I adapted the colors to go with the icon design.
Sardi icons to be found at https://sourceforge.net/projects/sardi

Omitted the lines to know the temperature in Antwerp. Service has been discontinued. It is allways these kind of services that fail us over time. May I suggest weather applets that are present in many distro's.


![Screenshots](http://i.imgur.com/sIty6BD.jpg)






# Aureola - Spark

![Screenshots](http://i.imgur.com/8rrvdQY.jpg)

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

# F  A  Q
--------------------

#What can you do if the script does not execute?

Since I sometimes forget to make the script executable, I include here what you can do to solve that.

A script can only run when it is marked as an executable.

	ls -al 

Above code will reveal if a script has an "x". X meaning executable.
Google "chmod" and "execute" and you will find more info.

For now if this happens, you should apply this code in the terminal and add the file name.

	chmod +x typeyourfilename

Then you can execute it by typing

	./typeyourfilename

Or you can follow these steps

![Screenshots](http://i.imgur.com/vXsOaFL.gif)


-------------------------------------------------
#But that is the fun in Linux.

You can do whatever <b>Y O U</b> want.

Share the knowledge.

I share my knowledge at http://erikdubois.be
------------------------------------------------
