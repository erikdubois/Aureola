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
#
##################################################################################################################
#
# Current project : Conky aureola
#
# Source 	: 	https://github.com/erikdubois/Aureola
#
##################################################################################################################
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


# this little batch file will autostart conky
# and copy the configuration file to the standard place
# where conky looks for a configuration file
# Lua syntax!!

# killing whatever conkies are still working
echo "################################################################"
echo "Stopping conky's if available"


killall conky 2>/dev/null
sleep 1

##################################################################################################################
###################### C H E C K I N G   E X I S T E N C E   O F   F O L D E R S            ######################
##################################################################################################################

# if there is no hidden folder autostart then make one
[ -d $HOME"/./config/autostart" ] || mkdir -p $HOME"/.config/autostart"

# if there is no hidden folder conky then make one
[ -d $HOME"/./config/conky" ] || mkdir -p $HOME"/.config/conky"



##################################################################################################################
######################              C L E A N I N G  U P  O L D  F I L E S                    ####################
##################################################################################################################

# removing all the old files that may be in ./config/conky with confirm deletion

if [ "$(ls -A ~/.config/conky)" ] ; then

	echo "################################################################"
	read -p "Everything in folder ~/.config/conky will be deleted. Are you sure? (y/n)?" choice

	case "$choice" in 
 	 y|Y ) rm -r ~/.config/conky/*;;
 	 n|N ) echo "No files have been changed in folder ~/.config/conky." & echo "Script ended!" & exit;;
 	 * ) echo "Type y or n." & echo "Script ended!" & exit;;
	esac

else
	echo "################################################################" 
	echo "Installation folder is ready and empty. Files will now be copied."

fi

##################################################################################################################
######################              M O V I N G  I N  N E W  F I L E S                        ####################
##################################################################################################################
echo "################################################################" 
echo "The files have been copied to ~/.config/conky."
# the standard place conky looks for a config file
cp * ~/.config/conky/

echo "################################################################" 
echo "Making sure conky autostarts next boot."
# making sure conky is started at boot
cp start-conky.desktop ~/.config/autostart/start-conky.desktop




##################################################################################################################
########################                    D E P E N D A N C I E S                     ##########################
##################################################################################################################

echo "################################################################"
echo "Checking dependancies"

DISTRO=$(lsb_release -si)

echo "################################################################"
echo "You are working on " $DISTRO
echo "################################################################"


case $DISTRO in 

	LinuxMint|linuxmint)


	# C O N K Y

		# check if conky is installed
		if ! location="$(type -p "conky")" || [ -z "conky" ]; then

			echo "################################################################"
			echo "installing conky for this script to work"
			echo "################################################################"

		  	sudo apt-get install conky-all

		  else
		  	echo "Conky was installed. Proceding..."
		fi

	# D M I D E C O D E


		# Acros depends on dmidecode to know the motherboard and manufacturer
		# check if dmidecode is installed

		if ! location="$(type -p "dmidecode")" || [ -z "dmidecode" ]; then

			echo "################################################################"
			echo "installing dmidecode for this script to work"
			echo "#################################################################"

		  	sudo apt-get install dmidecode

		  	#without this line dmidecode will not work - it needs sudo

		  	sudo chmod u+s /usr/sbin/dmidecode

		  else
		  	echo "Dmidecode was installed. Proceding..."

		fi


	# L M S E N S O R S


		# Acros depends on lm-sensors to know the motherboard and manufacturer
		# check if lm-sensors is installed

		if ! location="$(type -p "sensors")" || [ -z "sensors" ]; then

			echo "################################################################"
			echo "installing lm-sensors for this script to work"
			echo "#################################################################"

		  	sudo apt-get install lm-sensors



		  else
		  	echo "lm-sensors was installed. Proceding..."

		fi

		;;

	Arch)

		echo "You are using an arch machine"
		echo "For this conky to work fully"
		echo "you need to install the following packages"
		echo "- conky-lua"
		echo "- dmidecode"
		echo "- lm-sensors"
		echo "- archlogo included in files"
		;;
esac

##################################################################################################################
########################                    S T A R T  O F  C O N K Y                   ##########################
##################################################################################################################

echo "################################################################"
echo "Starting the conky"
echo "################################################################"

#starting the conky 
conky -c ~/.config/conky/conky.conf

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
