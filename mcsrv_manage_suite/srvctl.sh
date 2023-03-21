#!/bin/sh
# This program responses the control file operations.

echo "Service start..."
echo "Changing directory..."
cd /home/hdt2k/mcsrv/
echo "Control file response start."

while true
do
	ctlop=`cat /home/hdt2k/mcsrv/control`
	case $ctlop in
	reboot)
		echo Reboot command detected.
		# Reboot mcsrv:
		screen -S mcsrv_bg_proc -X quit
		echo Server stopped.
		sleep 2s
		mcsrv run bg
		echo remain_current > /home/hdt2k/mcsrv/control
	;;
	reboot_sys)
		# Reboot entire system:
		reboot
	;;
	exit_control)
		echo remain_current > /home/hdt2k/mcsrv/control
		exit 0
	;;
	esac
	# Limit reponse time:
	sleep 5s

done

