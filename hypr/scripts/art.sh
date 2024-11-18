#!/usr/bin/bash
url=$(playerctl metadata mpris:artUrl)
artist=$(playerctl metadata xesam:artist)
album=$(playerctl metadata xesam:album)
metadata=$(printf "$artist - $album")

if [ $url == "No player found" ]
then
  exit
elif [ -f /home/tdm/.cache/albumart/"$metadata".png ]
then
  echo /home/tdm/.cache/albumart/"$metadata".png
else
  curl -s $url -o /home/tdm/.cache/albumart/"$metadata"
  magick /home/tdm/.cache/albumart/"$metadata" /home/tdm/.cache/albumart/"$metadata".png
  rm /home/tdm/.cache/albumart/"$metadata"
  echo /home/tdm/.cache/albumart/"$metadata".png
fi

