#!/usr/bin/env bash 

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

if [ -n "$DESKTOP_DUAL_DISPLAY" ]; then
	echo "launching dual monitor mode"
	echo "---" | tee -a /tmp/polybar1.log 
	polybar dual_main 2>&1 | tee -a /tmp/polybar1.log & disown
	polybar dual_secondary 2>&1 | tee -a /tmp/polybar2.log & disown
else
	# Launch bar1 and bar2
	echo "launching single monitor mode"
	echo "---" | tee -a /tmp/polybar1.log 
	polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
fi

echo "Bars launched..."
