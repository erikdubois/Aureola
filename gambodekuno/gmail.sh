#!/bin/bash

curl -u fillinlogin@gmail.com:passwordofgmail https://mail.google.com/mail/feed/atom/unread | sed 's/<\/entry>/<\/entry>\n/g' | grep "<entry>" |wc -l