######################################
## display settings for destkop PC
##
if [ -n $DESKTOP_DUAL_DISPLAY ]; then
	xrandr --output DP-0 --primary --mode 2560x1440 --rate 143.97 --output HDMI-0 --mode 1920x1080 --rate 75.00 --left-of DP-0
fi

