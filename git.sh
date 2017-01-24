#!/bin/bash
#
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. AT YOUR OWN RISK.
#
##################################################################################################################


#echo "# Aureola" >> README.md
#git init
#git add README.md
#git commit -m "first commit"
#git remote add origin https://github.com/erikdubois/Aureola.git
#git push -u origin master


# git config --global user.name x
# git config --global user.email x
# sudo git config --system core.editor nano
# git config --global credential.helper cache
# git config --global credential.helper 'cache --timeout=3600'


# Force git to overwrite local files on pull - no merge

# git fetch all
# git reset --hard orgin/master


# Below command will backup everything inside the project folder
git add --all .

echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text
curtime=$(date)
git commit -m "Commit comment : $input on $curtime"

# Push the local snapshot to a remote destination
git push -u origin master
