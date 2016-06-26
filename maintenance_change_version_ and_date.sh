#==============================================================================
#                               aurora
# Date    : 26/06/2016
# Author  : Erik Dubois at http://www.erikdubois.be
# Version : v1.0.2
# License : Distributed under the terms of GNU GPL version 2 or later
# Documentation Dutch: http://erikdubois.be/linux/conky
#==============================================================================


find .  -name "conky.conf" -type f -exec sed -i  's/v1.0.2/v1.0.3/g' {} \;
find .  -name "conky.conf" -type f -exec sed -i  's/26\/06\/2016/27\/06\/2016/g' {} \;