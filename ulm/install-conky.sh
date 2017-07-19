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

FONT="SourceSansPro-ExtraLight"


if fc-list | grep -i $FONT >/dev/null ; then

	echo "################################################################" 
    echo "The font is already available. Proceeding ...";

else
	echo "################################################################" 
    echo "The font is not currently installed, would you like to install it now? (y/n)";
    read response
    if [[ "$response" == [yY] ]]; then
        echo "Installing the font to the ~/.fonts directory.";
        cp ~/.config/conky/fonts/* ~/.fonts
        echo "################################################################" 
        echo "Building new fonts into the cache files";
        echo "Depending on the number of fonts, this may take a while..." 
        fc-cache -fv ~/.fonts
		echo "################################################################" 
		echo "Check if the cache build was successful?";    
        if fc-list | grep -i $FONT >/dev/null; then
            echo "################################################################" 
            echo "The font was sucessfully installed!";
        else
        	echo "################################################################" 
            echo "Something went wrong while trying to install the font.";
        fi
    else
    	echo "################################################################" 	
        echo "Skipping the installation of the font.";
        echo "Please note that this conky configuration will not work";
        echo "correctly without the font.";
    fi

fi



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

	# D M I D E C O D E


		# The conky depends on dmidecode to know the motherboard and manufacturer
		# check if dmidecode is installed

		if ! location="$(type -p "dmidecode")" || [ -z "dmidecode" ]; then

			echo "################################################################"
			echo "installing dmidecode for this script to work"
			echo "#################################################################"

		  	sudo apt-get install -y dmidecode

		  	#without this line dmidecode will not work - it needs sudo

		  	sudo chmod u+s /usr/sbin/dmidecode

		  else

		  	echo "################################################################"
		  	echo "Dmidecode was installed. Proceeding..."
			echo "################################################################"
			echo "Setting the user rights for dmidecode to be able to use it in conky"
		  	sudo chmod u+s /usr/sbin/dmidecode

		fi


	# L M S E N S O R S


		# The conky depends on lm-sensors to know the motherboard and manufacturer
		# check if lm-sensors is installed

		if ! location="$(type -p "sensors")" || [ -z "sensors" ]; then

			echo "################################################################"
			echo "installing lm-sensors for this script to work"
			echo "#################################################################"

		  	sudo apt-get install -y lm-sensors



		  else
		  	echo "lm-sensors was installed. Proceeding..."

		fi
		;;

	Arch)

		echo "Installing software for your Arch machine"

	# L M S E N S O R S


		# The conky depends on lm-sensors to know the motherboard and manufacturer
		# check if lm-sensors is installed

		if ! location="$(type -p "sensors")" || [ -z "sensors" ]; then

			echo "################################################################"
			echo "installing lm-sensors for this script to work"
			echo "#################################################################"

		  	sudo pacman -S --noconfirm lm_sensors

		  else
		  	echo "################################################################"
		  	echo "lm-sensors was installed. Proceeding..."


		fi



	# D M I D E C O D E


		# The conky depends on dmidecode to know more info

		if ! location="$(type -p "dmidecode")" || [ -z "dmidecode" ]; then

			echo "################################################################"
			echo "installing dmidecode for this script to work"
			echo "#################################################################"

		  	sudo pacman -S --noconfirm dmidecode

		  else
		  	echo "################################################################"
		  	echo "dmidecode was installed. Proceeding..."


		fi

		echo "Setting the user rights for dmidecode to be able to use it in conky"
		 sudo chmod u+s /usr/sbin/dmidecode

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

	# D M I D E C O D E


		# The conky depends on dmidecode to know the motherboard and manufacturer
		# check if dmidecode is installed

		if ! location="$(type -p "dmidecode")" || [ -z "dmidecode" ]; then

			echo "################################################################"
			echo "installing dmidecode for this script to work"
			echo "#################################################################"

		  	sudo eopkg install -y dmidecode

		  	#without this line dmidecode will not work - it needs sudo

		  	sudo chmod u+s /usr/sbin/dmidecode

		  else

		  	echo "################################################################"
		  	echo "Dmidecode was installed. Proceeding..."
			echo "################################################################"
			echo "Setting the user rights for dmidecode to be able to use it in conky"
		  	sudo chmod u+s /usr/sbin/dmidecode

		fi


	# L M S E N S O R S


		# The conky depends on lm-sensors to know the motherboard and manufacturer
		# check if lm-sensors is installed

		if ! location="$(type -p "sensors")" || [ -z "sensors" ]; then

			echo "################################################################"
			echo "installing lm-sensors for this script to work"
			echo "#################################################################"

		  	sudo eopkg install -y lm_sensors



		  else
		  	echo "lm-_sensors was installed. Proceeding..."

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
