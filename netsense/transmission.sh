#! /bin/bash
#script reworked : http://ubuntuforums.org/showthread.php?t=1172278
#trim torrent name to this many characters
trim=40

#more settings further down marked with ========================


#get listing of all torrent info from transmission
# NOTE: you need to install transmission-cli AND UNINSTALL transmission-daemon
alltorrents=$(transmission-remote -l | sed -n -e '$b' -e '2,$p')


n=$(echo "$alltorrents" | wc -l)


#parse output to get data
#DO NOT EDIT THIS BIT
for i in `seq $n`
do
	torrent[$i]=$(echo "$alltorrents" | sed -n ''$i'p' | sed 's/   */\//g')

	progress[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $3}' | sed 's/%//')
	percent[$i]=$(echo 'scale=2; '${progress[$i]}'/100' | bc)
	have[$i]=$(echo  ${torrent[$i]} | awk -F/ '{print $4}')
	eta[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $5}')
	up[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $6}')
	down[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $7}')
	ratio[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $8}')
	status[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $9}')
	name[$i]=$(echo ${torrent[$i]} | awk -F/ '{print $10}' )
	#trim and add ellipsis if too long
	if [ `echo ${name[$i]} | wc -m` -gt $trim ]
	then
		
		name[$i]=$(echo ${name[$i]} | cut -c -$trim)...
	fi
done

#convert status to symbols


#output data to conky, using standard conky formating

#some more settings=====================================================
#=======================================================================

#limit output to a certain number of torrents, all is a=$n first four is a=4 etc
a=$n

#progress bar length from right edge of conky
barlength=80

#change colours of listing depending on status and/or add icons
# icons are webding fonts eg pause symbol, down arrow etc
#CHANGE COLORS TO DESIRED OR COMMENT OUT IF NO COLORS WANTED
#movedown=$(echo '14*'$n | bc)
#echo '${voffset -'$movedown'}'

for i in `seq $a`
do
	case ${status[$i]} in
	"Idle")
		icon[$i]='${font Webdings:size=12};${font}' 
		color[$i]="DDDDDD"	
		;;
	"Stopped")
		icon[$i]='${font Webdings:size=12}<${font}' 
		color[$i]="FF5C2B"	
		;;
	"Up & Down")
		icon[$i]='${font Webdings:size=12}6${font}' 
		color[$i]="77B753"
		;;
	"Downloading")
		icon[$i]='${font Webdings:size=12}6${font}' 
		color[$i]="77B753"
		;;
	"Seeding")
		icon[$i]='${font Webdings:size=12}5${font}'
		color[$i]='FF5C2B'
		;;
	*)
		;;
	esac

	#test to check we actually got some data back
if [ -z "$alltorrents" ] 
then
	#if not, print error message if you like, and exit
	echo ""
	echo " Nothing to download yet"
	exit
fi
#===================================================================

	#EDIT THE FOLLOWING BIT TO CONTROL DATA SEEN IN CONKY
	#enclose conky commands with ' '
	#enclose variables from this script with " " or nothing
	#in form ${name[$i]} where $i refers to the torrent number
	#possible variables are:
	#	progress	number 1-100 how much downloaded eg "45"
	#	percent		same but 0-1 eg "0.45"
	#	have		amount downloaded as string  eg "4.1 GB"
	#	eta			estimated time of arrival as string eg "4 hrs"
	#	up			transfer rate up in KB/s eg "21.1"
	# 	down		transfer rate down in KB/s eg "21.1"
	#	ratio		transfer ratio for torrent eg "0.88"
	#	status		eg "Downloading"
	#	icon		a small icon indicating status (see above 
	#				section)
	#	color		color depending on status (see above section)
	# 				eg "FF88AA" NB: must use exactly the format:
	# 				'${color '${color[$i]}'}' to apply the color to 
	#				a stretch of text, and remember to end it with
	#				'${color}'
	#	to draw the progress bar, use the exact command (incl single
	#	quotes)	'${execbar echo '${percent[%i]'}' and control the
	#	length with '${alignr '$barlength'}' where barlength defined above



	echo '${color '${color[$i]}'}'"${icon[$i]}"'${font NotoMono-Regular size=10 weight:bold}'"${name[$i]}"
#	torrent[$i]=$(echo "$alltorrents" | sed -n ''$i'p' | sed 's/   */\//g')'${color1}'
	echo ' ${color1}''Perc complete ' '${alignr}''${color1}'"${progress[$i]}"%'${color1}'
	echo ' Downloaded ''${alignr}${color1}'"${have[$i]}"''
	echo ' ${color1}ETA ${alignr}${color1}'"${eta[$i]}"
	echo ' ${color1}Up ${alignr}${color1}'"${up[$i]}"' KB/s'
	echo ' ${color1}Down' '${color1}${alignr}'"${down[$i]}"' KB/s'
	echo '${color '${color[$i]}'}'"${icon[$i]}"'${font NotoMono-Regular size=10 weight:bold}'"${status[$i]}"'${color1}'



#===================================================================
done