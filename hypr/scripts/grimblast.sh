export time=$(date +%Y-%m-%d_%H:%M:%S)

grimblast --freeze copysave area ~/Pictures/Screenshots/$time.png

dunstify "Screenshot saved" "$time.png" -t 5000 -I ~/Pictures/Screenshots/$time.png -r 0001
