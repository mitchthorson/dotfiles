#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -n $DESKTOP_DUAL_DISPLAY ]; then
	xrandr --output DP-2 --primary --mode 2560x1440 --rate 143.97 --output HDMI-0 --mode 1920x1080 --rate 75.00 --left-of DP-2
fi

nitrogen --restore &
picom --experimental-backends &
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
exec /usr/bin/i3
