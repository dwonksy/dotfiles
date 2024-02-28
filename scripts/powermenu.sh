#!/bin/sh

read -r -d '' MESSAGE <<- EOF
	 Power Off
	 Restart
	 Lock
EOF

select=$(printf "${MESSAGE}" | rofi -dmenu -theme-str '@import "popup.rasi"')

case $select in
	" Power Off")	poweroff ;;
	" Restart")	reboot ;;
	" Lock")	exit 0;;
	*)		exit 1 ;;
esac
