#!/bin/sh

PALETTE="langleyred"
TEMPLATES=(
	"./templates/rofi_template	$HOME/.config/rofi/theme.rasi"
	"./templates/polybar_template	$HOME/.config/polybar/config.ini"
	"./templates/alacritty_template	$HOME/.config/alacritty/alacritty.yml"
)

################################################################################

setcolors () {
	local PALETTE_PATH="./colors/${1}"
	local FILE_IN="${2}"
	local FILE_OUT="${3}"
	local FILE_TMP="${3}.tmp"

	cp $FILE_IN $FILE_OUT

	for COLNO in {0..15}; do
		# Get colors
		COLOR_REF="color${COLNO}"
		COLOR_HEX=$(awk -v ref="${COLOR_REF}:" '$1 ~ ref { print $2 }' $PALETTE_PATH)
		COLOR_HEX=${COLOR_HEX#\#}	# Removes "#" prefix

		# Find and replace colors
		cp $FILE_OUT $FILE_TMP
		sed "s/_${COLOR_REF}_/${COLOR_HEX}/g" $FILE_TMP > $FILE_OUT
	done

	rm $FILE_TMP
}

cd "$HOME/.config/themes"

cp "./colors/$PALETTE" "$HOME/.config/Xresources"

for i in ${!TEMPLATES[@]}; do
	setcolors $PALETTE ${TEMPLATES[$i]}
done

cp "./images/${PALETTE}_desktop.jpg" "./wallpapers/desktopbg.jpg"
cp "./images/${PALETTE}_lock.jpg" "./wallpapers/lockbg.jpg"
