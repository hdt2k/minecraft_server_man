#!/bin/bash
# Minecraft Server Launcher
# This script is order to run Minecraft server in a convenient way.
# Created by hdtune2k

case $1 in
run)
	echo "Starting Minecraft server..."

	echo "Changing directory..."
	cd /home/hdt2k/mcsrv/

	echo "Calling main program..."
	# Modify the jar file name to change main program.
	case $2 in
	fg)
		java -Xms256M -Xmx1G -jar /home/hdt2k/mcsrv/forge-1.12.2-14.23.5.2860.jar
		exit
	;;
	bg)
		screen -dmS mcsrv_bg_proc
		screen -S mcsrv_bg_proc -X screen java -Xms256M -Xmx1G -jar /home/hdt2k/mcsrv/forge-1.12.2-14.23.5.2860.jar
		echo "Called main program in background using a new screen session."
		echo "Use 'rtn' option to return running server session."
		exit
	;;
	esac
	echo "Error: run mode option is not specified."
	exit
;;
ctlsrv)
	case $2 in
	rtn)
		screen -r mcsrv_ctlsrv
		exit
		;;
	esac
	echo "Starting Minecraft server control file response service..."
	screen -dmS mcsrv_ctlsrv
	screen -S  mcsrv_ctlsrv -X screen /home/hdt2k/mcsrv/srvctl.sh
	echo "Control file service has been started."
	exit
;;
rtn)
	echo "Switching to background server session..."
	screen -r mcsrv_bg_proc
	echo "Session was detached or closed."
	exit
;;
chkdpcy)
	sudo apt-get install screen
	exit
;;
help)
	echo "MCSrv - A script used to manage Minecraft server."
	echo "Options:"
	echo "	run - Run configured Minecraft server."
	echo "	rtn - Return to a background running server."
	echo "	ctlsrv - Run control response service. Use 'ctlsrv rtn' to see service log."
	echo "	chkdpcy - Check if dependencies were corretly installed."
	echo "	help - show this document."
	echo "Notice: If you got an error of command not found, try using 'chkdpcy' option to fix it."
	echo "Created by hdtune2k."
	exit
;;
esac

# No input handle:
echo "Error: missing options."
echo "Use 'help' to display manual document."

