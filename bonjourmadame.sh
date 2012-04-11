#!/bin/bash
DATE=$(date +"%F")
PHOTO="/tmp/photo$DATE.jpg"
HIER=$(date +%F --date=-1day)
PHOTOHIER="/tmp/photo$HIER.jpg"
URL=`wget -O - -q http://www.bonjourmadame.fr/ | grep -Eo "(http://www.bonjourmadame.fr/photo/[^\"]+)|(http://[0-9]+.media.tumblr.com/tumblr[^\"]+)" | head -n 1` 

cd /tmp/
if [ ! -e $PHOTO ]; then
#rm $PHOTOHIER
wget -q $URL -O $PHOTO #Quiet mode
jp2a $PHOTO 
sleep 2
clear
else
jp2a $PHOTO 
sleep 2
clear
fi
