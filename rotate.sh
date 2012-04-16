#!/bin/bash

eraser=`xinput --list | grep eraser | awk '{print $7}'`
eraser=`echo $eraser | sed -e "s/id=//g"`
stylus=`xinput --list | grep stylus | awk '{print $7}'`
stylus=`echo $stylus | sed -e "s/id=//g"`

if [ -e ~/.pivot ]; then
     rm -f ~/.pivot
     xrandr -o normal && xsetwacom set $eraser rotate none  #Eraser
     xrandr -o normal && xsetwacom set $stylus rotate none  #Stylus
     killall florence
     notify-send "PC mode"

else
     touch ~/.pivot
     xrandr -o left && xsetwacom set $eraser rotate CCW  #Eraser
     xrandr -o left && xsetwacom set $stylus rotate CCW  #Stylus
     florence -n
     #xvkbd -always-on-top -geometry 800x150+0-0    #Enlevez le # pour activer le clavier virtuel en mode portrait
     notify-send "Tablet mode"
fi
