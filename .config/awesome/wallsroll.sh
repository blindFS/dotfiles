#! /bin/bash
WALLPAPERS="/home/farseer/.config/awesome/wallpapers/"
ALIST=( `ls -w1 $WALLPAPERS` )
RANGE=${#ALIST[@]}
let "number = 1"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last
awsetbg $WALLPAPERS/${ALIST[$number]}

