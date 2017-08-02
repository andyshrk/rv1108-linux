#!/bin/sh
DIR=$(cd `dirname $0`; pwd)
OFFSET=0x10000000
VAL=0

if [ "$1"x != "w"x  ]; then
   VAL=1
   echo "download to ram"
else
   OFFSET=0
   echo "download to flash"
fi

upgrade_tool db ${DIR}/RV1108_usb_boot.bin
upgrade_tool wl $OFFSET ${DIR}/Firmware.img
upgrade_tool rd $VAL
