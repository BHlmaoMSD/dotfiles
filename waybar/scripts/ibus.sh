status=$(ibus engine | grep BambooUs)

if [ -n "$status" ]
then
   ibus engine Bamboo >> /dev/null
   notify-send "language Input" "Changed to VN" -i /usr/share/ibus-bamboo/icons/vi.svg -t 1000 -r 1006
else
   ibus engine BambooUs >> /dev/null
   notify-send "language Input" "Changed to US" -i /usr/share/ibus-bamboo/icons/us.svg -t 1000 -r 1006
fi

## Nếu các ông dùng cái này thì chọn phương thức nhập là Bamboo Và BambooUS nha
