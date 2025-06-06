#!/bin/bash

cd ~/.config/i3/Scripts

rm keys.txt

regex='(#.*)bind(code|sym)\s(\S*)\s(.*)'

cat ~/.config/i3/config | sed ':a;N;$ba;s/\(#.*\)\n/\1 /g' | \
    while read CMD; do
        if [[ $CMD =~ $regex ]]
        then
            if [[ ${BASH_REMATCH[0]} ]]
            then
                match="${BASH_REMATCH[0]}"
                commentary=`echo "${BASH_REMATCH[1]}" | awk '{$1=$1};1'`
                bind=`echo "${BASH_REMATCH[3]}" | awk '{$1=$1};1'`
                printf "%-40s" "$commentary" "$bind" >> keys.txt
                printf "\n" >> keys.txt
            fi
        fi
    done

magick -size 2000x2000 xc:"#204B6F" -font "Inconsolata-Regular" -pointsize 18 -fill "#FFD700" \
-annotate +20+20 @keys.txt -trim -bordercolor "#204B6F" -border 20 +repage keys.png

feh --no-menus --title "cheat" keys.png

rm keys.png
