#!/bin/bash
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
[ -d $HOME"/.config/autostart" ] || mkdir -p $HOME"/.config/autostart"

# if there is no hidden folder conky then make one
[ -d $HOME"/.config/conky" ] || mkdir -p $HOME"/.config/conky"

# if there is no hidden folder fonts then make one
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"




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
cp -r * ~/.config/conky/

echo "################################################################" 
echo "Making sure conky autostarts next boot."
# making sure conky is started at boot
cp start-conky.desktop ~/.config/autostart/start-conky.desktop



##################################################################################################################
########################                           F O N T S                            ##########################
##################################################################################################################



echo "################################################################" 
echo "Installing the fonts if you do not have it yet - with choice"




##################################################################################################################
########################                        D I S T R O                             ##########################
##################################################################################################################


echo "################################################################"
echo "Checking presence of lsb-release and install it when missing"

	if ! location="$(type -p "lsb_release")" || [ -z "lsb_release" ]; then

		# check if apt-git is installed
		if which apt-get > /dev/null; then

			sudo apt-get install -y lsb-release

		fi

		# check if pacman is installed
		if which pacman > /dev/null; then

			sudo pacman -S --noconfirm lsb-release

		fi

	fi


DISTRO=$(lsb_release -si)

echo "################################################################"
echo "You are working on " $DISTRO
echo "################################################################"


##################################################################################################################
########################                    D E P E N D A N C I E S                     ##########################
##################################################################################################################




case $DISTRO in 

	LinuxMint|linuxmint|Ubuntu|ubuntu)


	# C O N K Y

		# check if conky is installed
		if ! location="$(type -p "conky")" || [ -z "conky" ]; then

			echo "################################################################"
			echo "installing conky for this script to work"
			echo "################################################################"

		  	sudo apt-get install -y conky-all

		  else
		  	echo "Conky was installed. Proceeding..."
		fi




		;;

	Arch)

		echo "Installing software for your Arch machine"




	# C O N K Y

		# check if conky is installed

		if pacman -Q conky > /dev/null ; then


			echo "################################################################"
			echo "Conky is already installed. Proceeding..."



		else

			echo "################################################################"
			echo "installing conky for this script to work"
			echo "you may need to install conky-lua-nv manually"



			program="conky"


			if which pacaur > /dev/null; then

				echo "Installing with pacaur"
				pacaur -S --noconfirm --noedit  $program

			elif which packer > /dev/null; then

				echo "Installing with packer"
				packer -S --noconfirm --noedit  $program 	

			elif which yaourt > /dev/null; then

				echo "Installing with yaourt"
				yaourt -S --noconfirm --noedit  $program
				  	
			fi

		fi

		;;

	Solus)
	
	# C O N K Y

		# check if conky is installed
		if ! location="$(type -p "conky")" || [ -z "conky" ]; then

			echo "################################################################"
			echo "installing conky for this script to work"
			echo "################################################################"

		  	sudo eopkg install -y conky

		  	echo "At this point in time Solus has reverted back to 1.9 version"
		  	echo "Script to get the latest version is on my github"
		  	echo "http://github.com/erikdubois"
		  	echo "Check that you have at least version 1.10"
		  	conky --version
		  else
		  	echo "Conky was installed. Proceeding..."
		fi


		;;


	*)
		echo "No dependancies installed."
		echo "No installation lines for your system."
		;;
esac

##################################################################################################################
########################                    S T A R T  O F  C O N K Y                   ##########################
##################################################################################################################

echo "################################################################"
echo "Starting the conky"
echo "################################################################"

#starting the conky 
conky -q -c ~/.config/conky/conky.conf

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
