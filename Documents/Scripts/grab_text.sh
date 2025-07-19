#!/bin/bash 
# Dependencies: tesseract-ocr imagemagick scrot xsel gnome-screenshot libnotify-bin

#tesseract_lang=eng+ita
LANG=eng+ita
# quick language menu, add more if you need other languages.

SCR_IMG=`mktemp`
trap "rm $SCR_IMG*" EXIT

#grim -g "$(slurp)" -q 100 -l 1 $SCR_IMG.png
#scrot -s -f $SCR_IMG.png -q 100
gnome-screenshot -a -f $SCR_IMG.png
# increase image quality with option -q from default 75 to 100

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png

#should increase detection rate

#tesseract $SCR_IMG.png $SCR_IMG &> /dev/null
tesseract $SCR_IMG.png $SCR_IMG -l $LANG &> /dev/null

cat $SCR_IMG.txt | xsel -bi

notify-send --app-name "Text copier" --icon "/home/chromiell/Documents/Scripts/TextGrabber.png" "Text copied from the screen" "Now you can paste it wherever you like"

exit