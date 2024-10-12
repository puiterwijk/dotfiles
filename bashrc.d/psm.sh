#!/usr/bin/bash
function psmc() {
	file=$(ls -1 --sort=time --time=ctime 172-*rdp | head -1)
	if [ "x$file" == "x" ];
	then
		echo "No file found"
		return 1
	fi
	echo "Connecting to '$file'"
	xfreerdp "$file" /scale:140 /d: /p: /cert:ignore &
	sleep 2
	mv "$file" "old-rdp/"
}
