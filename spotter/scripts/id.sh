#!/bin/bash

id=`dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep spotify:track | cut -d ":" -f3 | cut -d '"' -f1 | sed -n '1p'`
echo $id