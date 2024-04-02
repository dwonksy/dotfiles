#!/bin/sh

read -r -d '' MESSAGE <<- EOF
 Browser
 File Manager
 Mail
 Office
 Krita
 Blender
EOF

select=$(printf "${MESSAGE}" | rofi -dmenu -theme-str '@import "popup.rasi"')

case $select in
	" Browser") 		exec librewolf ;;
	" File Manager")	exec dolphin ;;
	" Mail") 		exec thunderbird ;;
	" Office") 		exec libreoffice ;;
	" Krita") 		exec krita ;;
	" Blender")		exec blender ;;
	*)			exit 1 ;;
esac
