#!/bin/bash

artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)

case "$1" in
--title)
  echo $title
  ;;
--artist)
  echo $artist
  ;;
esac
