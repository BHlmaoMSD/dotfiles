#!/bin/sh
status="$(nmcli general status | grep -oh "\w*connect\w*")"

if [[ "$status" == "disconnected" ]]; then
  printf "Disconnected 󰤮⠀"
elif [[ "$status" == "connecting" ]]; then
  proc "Connecting 󱍸⠀"
elif [[ "$status" == "connected" ]]; then
  wow="$(echo $(nmcli con show --active | awk 'NR==2 {print $5}'))"
  if [ "$wow" == "ethernet" ]
  then
    #printf "Wierd In "
    printf "󰈀⠀\n"
  else
    #ssid="$(echo $(nmcli -g name connection show --active | awk 'NR==1'))"
    #printf "$ssid  "
    strength="$(echo $(awk 'NR==3 {print $3}' /proc/net/wireless) | sed 's/\.//g')"
    if [[ "$?" == "0" ]]; then
      if [[ "$strength" -eq "0" ]]; then
        printf "󰤯⠀\n"
      elif [[ ("$strength" -ge "0") && ("$strength" -le "25") ]]; then
        printf "󰤟⠀\n"  
      elif [[ ("$strength" -ge "25") && ("$strength" -le "50") ]]; then
        printf "󰤢⠀\n"
      elif [[ ("$strength" -ge "50") && ("$strength" -le "75") ]]; then
        printf "󰤥⠀\n"
      elif [[ ("$strength" -ge "75") && ("$strength" -le "100") ]]; then
        printf "󰤨⠀\n"
      fi
    else
      printf "Idk :))"
    fi
  fi
fi
