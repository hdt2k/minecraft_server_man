@echo off
title MCSrv Run Script for Windows
rem This program runs the Minecraft server on Windows.
rem Created by hdtune2k

echo Launching Minecraft server...
java -Xms1024M -Xmx2048M -jar forge-1.12.2-14.23.5.2860.jar nogui

echo Server terminated, press any key to exit...
pause>nul
exit
