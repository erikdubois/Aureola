#!/bin/bash

imgurl=`curl -X GET https://api.spotify.com/v1/tracks/$1 | grep '"url" : ' | sed '2q;d' | cut -d '"' -f4`
echo $imgurl
