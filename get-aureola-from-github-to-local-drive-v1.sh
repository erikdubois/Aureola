#!/bin/bash
#
#                                       
# MMMMMMMMMMMMMMMMMMMMMMMMMmds+.        
# MMm----::-://////////////oymNMd+`     
# MMd      /++                -sNMd:    
# MMNso/`  dMM    `.::-. .-::.` .hMN:   
# ddddMMh  dMM   :hNMNMNhNMNMNh: `NMm   
#     NMm  dMM  .NMN/-+MMM+-/NMN` dMM   
#     NMm  dMM  -MMm  `MMM   dMM. dMM   
#     NMm  dMM  -MMm  `MMM   dMM. dMM   
#     NMm  dMM  .mmd  `mmm   yMM. dMM   
#     NMm  dMM`  ..`   ...   ydm. dMM   
#     hMM- +MMd/-------...-:sdds  dMM   
#     -NMm- :hNMNNNmdddddddddy/`  dMM   
#      -dMNs-``-::::-------.``    dMM   
#       `/dMNmy+/:-------------:/yMMM  
#          ./ydNMMMMMMMMMMMMMMMMMMMMM  
#             \.MMMMMMMMMMMMMMMMMMM    
#                                      
#
#=====================================================================================
#                               Aureola
# Date    : 08/07/2016
# Author  : Erik Dubois at http://www.erikdubois.be
# Version : v1.1.0
# License : Distributed under the terms of GNU GPL version 2 or later
# Documentation English: http://erikdubois.be/linux/install-conky-theme-aurora
# Documentation Dutch: http://erikdubois.be/linux/conky
#======================================================================================
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
# 
# More from Erik Dubois
#
# Aurora Conky
# at http://sourceforge.net/projects/auroraconkytheme/
# Explanation on the use of this theme can be found at 
# http://erikdubois.be/category/linux/aurora-conky/
# 
# Aureola Conky
# Collections of nice conky's with lua syntax
# https://github.com/erikdubois/Aureola
#
# Sardi icons
# Many different styles of icons from colourfull, monochrome, white, circle
# https://sourceforge.net/projects/sardi/
#
# Super Ultra Flat Numix Remix
# Colourfull and playfull icons
# https://github.com/erikdubois/Super-Ultra-Flat-Numix-Remix
#
# Check out the github - many more scripts for automatic installation of Linux Systems.
#
#
#
#
#
##################################################################################################################
# If the option -y has been added. It will autoinstall all. Omit if you do not want that.
##################################################################################################################
#
#
#
#
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. AT YOUR OWN RISK.
#
##################################################################################################################


########################################
########        C O N K Y      #########
########################################



##################################################################################################################
###################### C H E C K I N G   E X I S T E N C E   O F   F O L D E R S            ######################
##################################################################################################################b

# if there is already a folder in tmp, delete or else do nothing
[ -d /tmp/aureola ] && rm -rf "/tmp/aureola" || echo ""
# download the github in folder /tmp/aureola

echo "################################################################"
echo "Checking if git is installed"
echo "Install git for an easy installation"


	# G I T

		# check if git is installed
		if ! location="$(type -p "git")" || [ -z "git" ]; then

			echo "################################################################"
			echo "installing git for this script to work"
			echo "################################################################"

		  	sudo apt-get install git

		  else
		  	echo "git was installed. Proceding..."
		fi



echo "################################################################"
echo "Downloading the files from github to tmp directory"


git clone https://github.com/erikdubois/Aureola /tmp/aureola

# if there is no hidden folder autostart then make one

echo "################################################################"
echo "Check if there is a ~/.config/autostart folder else make one"

[ -d $HOME"/./config/autostart" ] || mkdir -p $HOME"/.config/autostart"

echo "################################################################"
echo "Check if there is a ~./config/conky folder else make one"


# if there is no hidden folder conky then make one
[ -d $HOME"/./config/conky" ] || mkdir -p $HOME"/.config/conky"

echo "################################################################"
echo "Check if there is a ~/.aureola folder else make one"


# if there is no hidden folder aureola then make one
# my choice to put all config files in a hidden folder out of side
[ -d "~/.aureola" ] || mkdir -p $HOME/".aureola"




##################################################################################################################
######################              C L E A N I N G  U P  O L D  F I L E S                    ####################
##################################################################################################################

# removing all the old files that may be in .aureola with confirm deletion

if find ~/.aureola -mindepth 1 > /dev/null ; then

	read -p "Everything in folder ~/.aureola will be deleted. Are you sure? (y/n)?" choice
	case "$choice" in 
 	 y|Y ) rm -r ~/.aureola/*;;
 	 n|N ) echo "Nothing has changed." & echo "Script ended!" & exit;;
 	 * ) echo "Type y or n." & echo "Script ended!" & exit;;
	esac

else
	echo "################################################################" 
	echo "Installation folder is ready and empty. Files will now be copied."

fi

##################################################################################################################
######################              M O V I N G  I N  N E W  F I L E S                        ####################
##################################################################################################################


# copy all config files to this hidden folder
cp -r /tmp/aureola/* ~/.aureola
rm -rf /tmp/aureola

echo "################################################################"
echo "In this hidden folder ~/.aureola you will find your download."
echo "################################################################" 
echo "Now choose a conky to install. Get inside the folder and run"
echo "the installation script. This will install a conky and will "
echo "make sure all the dependancies (read software) will be"
echo "installed as well. Check if some of the commands in the conky config"
echo "really exist on your system and change the config accordingly."
echo "Fonts will be installed if you do not have them."
echo "################################################################"



echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
