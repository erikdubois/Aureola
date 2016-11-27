#!/bin/bash

year=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep T00 | cut -d '"' -f2  | cut -d '-' -f1`
echo $year