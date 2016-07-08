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
# Current project : Ultimate-Linux-Mint-18
#
# Source 	: 	https://github.com/erikdubois/Ultimate-Linux-Mint-18
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


########################################
########        C O N K Y      #########
########################################
	echo "Installing conky and the required ubuntu packages -DEBIAN"
	echo "----------------------------------------------------------------------"
	echo 'Purpose 	: automatisation of installation'
	echo "Author 	: Erik Dubois"
	echo "Use 		: at own risk and with fun"
	echo "----------------------------------------------------------------------"
	echo "----------------------------------------------------------------------"
	echo "Creation Date 	: 	26/06/2016"
	echo "Version 			:	v3.0.4 "
	echo
	echo
	echo "This script will install conky,conkymanager,"
	echo "sensory input and harddisk temperature etc"
	echo "you will NEED these"
	echo "some of the functionality depends on it"
	echo "More information on http://conky.sourceforge.net/"
	echo "More information on http://erikdubois.be"
	echo "----------------------------------------------------------------------"
	echo "Overview of packages"
	echo "----------------------------------------------------------------------"
	echo "CURL"
	echo "CURL - Get a file from an HTTP, HTTPS or FTP server"
	echo "curl is a client to get files from servers using any of the supported"
	echo "protocols." 
	echo "----------------------------------------------------------------------"
	echo "LM-SENSORS"
	echo "utilities to read temperature/voltage/fan sensors"
	echo "Lm-sensors is a hardware health monitoring package for Linux." 
	echo "----------------------------------------------------------------------"
	echo "HDDTEMP"
	echo "hard drive temperature monitoring utility"
	echo "The hddtemp program monitors and reports the temperature"
	echo "----------------------------------------------------------------------"
	echo "DMIDECODE"
	echo "To be able to read out what motherboardname you have."
	echo "----------------------------------------------------------------------"
	echo "TRANSMISSION-CLI"
	echo "To be able to read out what torrent downloads you have."
	echo "----------------------------------------------------------------------"
	echo "SPOTIFY"
	echo "For the music you love. Or else no widget"
	echo "----------------------------------------------------------------------"
	echo "SMART MONITOR TOOLS"
	echo "To read out various information on your harddisk"
	echo "----------------------------------------------------------------------"
	echo "LAST BUT NOT LEASE CONKY AND THE CONKY MANAGER"
	echo "----------------------------------------------------------------------"
	echo "Conky is a tool to monitor various parts in your computer."
	echo "----------------------------------------------------------------------"
	echo "adding REPOSITORY for conky-manager and installing conky etc..."
	sudo add-apt-repository -y ppa:teejee2008/ppa
	echo "----------------------------------------------------------------------"
	echo "Updating ..."
	echo "----------------------------------------------------------------------"
	sudo apt-get update
	echo "----------------------------------------------------------------------"
	echo "installing sofware"
	echo "----------------------------------------------------------------------"
	sudo apt-get install -y conky-manager conky conky-all\
	 lm-sensors hddtemp dmidecode smartmontools curl transmission-cli\
	 ttf-ubuntu-font-family
	echo "Giving the rights so the programs can work in the script as root"
	echo "hddtemp, dmidecode, smartclt"
	sudo chmod u+s /usr/sbin/hddtemp
	sudo chmod u+s /usr/sbin/dmidecode
	sudo chmod u+s /usr/sbin/smartctl
	#installing necessary fonts
	echo "installing necessary fonts"
	[ -d "~/.fonts" ] || mkdir -p $HOME/".fonts"
	cp ./fonts/* ~/.fonts
	sudo chown $USER ~/.fonts
	sudo chmod 644 ~/.fonts/*
	fc-cache -fv
	echo "Hidden folder conky is created if it is not there"
	[ -d "~/.conky" ] || mkdir -p $HOME/".conky"
	echo "----------------------------------------------------------------------"
	echo "CONKY IS INSTALLED WITH ALL ITS COMPONENTS"
	echo "----------------------------------------------------------------------"
	echo "ALMOST THERE"
	echo "----------------------------------------------------------------------"
	sudo sensors-detect
	sudo service kmod start
    	echo "----------------------------------------------------------------------"
	echo "SENSORS-DETECT DONE"
	echo "SOME CHANGES MUST BE MADE MANUALLY E.G. fill in your gmail account settings"
	echo "THE INSTALL FILE IS THERE TO HELP"
	echo "----------------------------------------------------------------------"
	echo "DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE DONE"


echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
